import gimnasia.*

class Persona {
    var property peso
    method pesoPerdidoConRutina(rutina){
        return rutina.caloriasQuemadas(self.tiempo()) / self.kilosPorCaloriaQuePierde()
    }
    method ejercitar(rutina){
        self.validarEjercicio(rutina)
        peso = peso - self.pesoPerdidoConRutina(rutina)
    }
    method tiempo()
    method kilosPorCaloriaQuePierde()
    method validarEjercicio(rutina)
}
class PersonaSedentaria inherits Persona {
    var property tiempo

    override method tiempo() {
        return tiempo
    }
    override method kilosPorCaloriaQuePierde() {
        return 7000
    }
    override method validarEjercicio(rutina) {
        if (peso < 50) {
            self.error("No puede realizar esta rutina, peso menor al permitido")
        }
    }
}
class PersonaAtleta inherits Persona{
    override method pesoPerdidoConRutina(rutina) {
        return super(rutina)-1
    }
    override method kilosPorCaloriaQuePierde() {
        return 8000
    }
    override method tiempo() {
        return 90
    }
    override method validarEjercicio(rutina) {
        if (not self.quemaSuficientesCalorias(rutina)) {
            self.error("No puede realizar esta rutina")
        }
    }
    method quemaSuficientesCalorias(rutina) {
        return rutina.caloriasQuemadas(self.tiempo()) > 10000
    }
}
