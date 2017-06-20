package com.fco271292

class AreaNegocio {

    static constraints = {
    	area nullable:false, minSize:2
    }

    static hasMany = [colaboradores:Colaborador]
    
    String area

}
