
package pe.edu.pucp.lp2soft.services;

import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
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
            HashMap parametros = new HashMap();
            parametros.put("fecha1",fecha1);
            parametros.put("fecha2",fecha2);
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
            
            JasperPrint jp = JasperFillManager.fillReport(reporte,null, con);
            con.close();
            reporteBytes = JasperExportManager.exportReportToPdf(jp);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reporteBytes;
    }
}
