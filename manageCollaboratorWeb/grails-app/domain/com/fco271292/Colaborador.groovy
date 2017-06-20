package com.fco271292

class Colaborador {

    static constraints = {	
    	nombre nullable:false, minSize:2
    	apellidoPaterno nullable:false, minSize:2
    	apellidoMaterno nullable:true
    }

    static belongsTo = [areaNegocio:AreaNegocio]
    
    String nombre
    String apellidoPaterno
    String apellidoMaterno

}
