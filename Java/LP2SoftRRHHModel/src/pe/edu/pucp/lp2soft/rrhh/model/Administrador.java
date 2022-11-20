package pe.edu.pucp.lp2soft.rrhh.model;

import pe.edu.pucp.lp2soft.enums.Area;



public class Administrador extends Usuario {
    private Area area;

    public Administrador() {
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }
    
    
}
