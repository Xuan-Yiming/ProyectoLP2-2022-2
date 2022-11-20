
package pe.edu.pucp.lp2soft.services;

import com.lowagie.text.Image;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.swing.ImageIcon;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import pe.edu.pucp.lp2soft.config.DBManager;


@WebService(serviceName = "ReporteWS")
public class ReporteWS {

    private Connection con;
    @WebMethod(operationName = "generarReporteVentasPeriodo")
    public byte[] generarReporteVentasPeriodo(@WebParam(name = "fecha1") Date fecha1,@WebParam(name = "fecha2") Date fecha2) {
        byte[] reporteBytes = null;
        try{
            con = DBManager.getInstance().getConnection();
            JasperReport reporte = (JasperReport) JRLoader.loadObject(
                ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/ReporteVentasPeriodo.jasper"));
            String rutaImagen = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/img/Background.png").getPath();
            java.awt.Image imagen = (new ImageIcon(rutaImagen)).getImage() ;
            HashMap parametros = new HashMap();
            parametros.put("fecha1",fecha1);
            parametros.put("fecha2",fecha2);
            parametros.put("imagen",imagen);
            JasperPrint jp = JasperFillManager.fillReport(reporte, parametros, con);
            con.close();
            reporteBytes = JasperExportManager.exportReportToPdf(jp);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reporteBytes;
    }
    
    @WebMethod(operationName = "generarReporteVendedoresMasVentas")
    public byte[] generarReporteVendedoresMasVentas() {
        byte[] reporteBytes = null;
        try{
            con = DBManager.getInstance().getConnection();
            JasperReport reporte = (JasperReport) JRLoader.loadObject(
                ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/ReporteVendedoresMasVentas.jasper"));
            String rutaImagen = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/img/Background.png").getPath();
            java.awt.Image imagen = (new ImageIcon(rutaImagen)).getImage() ;
            HashMap parametros = new HashMap();
            parametros.put("imagen",imagen);
            JasperPrint jp = JasperFillManager.fillReport(reporte,parametros, con);
            con.close();
            reporteBytes = JasperExportManager.exportReportToPdf(jp);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reporteBytes;
    }
    
    @WebMethod(operationName = "generarReporteDeudores")
    public byte[] generarReporteDeudores() {
        byte[] reporteBytes = null;
        try{
            con = DBManager.getInstance().getConnection();
            JasperReport reporte = (JasperReport) JRLoader.loadObject(
                ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/ClientesDeudores.jasper"));
            String rutaSubReporte = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/SubReporteClientesDeudores.jasper").getPath();
            String rutaImagen = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/img/Background.png").getPath();
            java.awt.Image imagen = (new ImageIcon(rutaImagen)).getImage() ;
            HashMap parametros = new HashMap();
            parametros.put("imagenLogo",imagen);
            parametros.put("subReporteClientesDeudores",rutaSubReporte);
            
            JasperPrint jp = JasperFillManager.fillReport(reporte,parametros, con);
            con.close();
            reporteBytes = JasperExportManager.exportReportToPdf(jp);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reporteBytes;
    }
    
    @WebMethod(operationName = "generarReporteTop5Clientes")
    public byte[] generarReporteTop5Clientes() {
        byte[] reporteBytes = null;
        try{
            con = DBManager.getInstance().getConnection();
            JasperReport reporte = (JasperReport) JRLoader.loadObject(
                ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/Top5Clientes.jasper"));
            String rutaSubReporte = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/report/SubReporteTop5Clientes.jasper").getPath();
            String rutaImagen = ReporteWS.class.getResource("/pe/edu/pucp/lp2soft/img/Background.png").getPath();
            java.awt.Image imagen = (new ImageIcon(rutaImagen)).getImage() ;
            HashMap parametros = new HashMap();
            parametros.put("imagenLogo",imagen);
            parametros.put("subReporteTop5Clientes",rutaSubReporte);
            
            JasperPrint jp = JasperFillManager.fillReport(reporte,parametros, con);
            con.close();
            reporteBytes = JasperExportManager.exportReportToPdf(jp);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reporteBytes;
    }

    
}


