import personas.*
import gimnasia.*
class Predio {
    const property rutinas = []

    method totalCaloriasGastadas(persona) {
        return rutinas.sum({ rutina => rutina.caloriasQuemadas(persona.tiempo()) })
    }
    method rutinaMasExigentePara(persona) {
        return rutinas.max({ rutina => rutina.caloriasQuemadas(persona.tiempo()) })
    }
    method esPredioTranquiParaPersona(persona) {
        return rutinas.any({ rutina => rutina.caloriasQuemadas(persona.tiempo()) < 500 })
    }
}

class Club {
    const property predios = []

    method mejorPredioPara(persona) {
        return predios.max({ predio => predio.totalCaloriasGastadas(persona) })
    }
    method prediosTranquisPara(persona) {
        return predios.filter({ predio => predio.esPredioTranquiParaPersona(persona) })
    }
    method rutinasMasExigentesPara(persona) {
        return predios.map({ predio => predio.rutinaMasExigentePara(persona) }).asSet() 
    }
}