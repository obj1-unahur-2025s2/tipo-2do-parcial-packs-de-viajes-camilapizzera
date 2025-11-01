class Pack{
    const property duracion 
    const precioBase 
    const beneficiosEspeciales = []
    const property coordinador 
    
    method beneficiosVigentes() = beneficiosEspeciales.filter({b => b.estaVigente()})
    method valorFinal() = precioBase + self.beneficiosVigentes().sum({b => b.costo()})
    method esPackPremium()
}

class PackNacional inherits Pack {
    const property provinciaDestino
    const property actividadesIncluidas = []
    override method esPackPremium() = self.duracion() > 10 && coordinador.esAltamenteCalificado()
}

class PackProvincial inherits PackNacional {
    const property cantidadCiudadesAVisitar
    override method esPackPremium() = actividadesIncluidas.size() > 3 && cantidadCiudadesAVisitar > 5 && self.beneficiosVigentes().size() > 2 
    override method valorFinal() = if(self.esPackPremium()) super() * 1.05 else super() 
}

class PackInternacional inherits Pack {
    const property paisDestino
    const property cantidadDeEscalas
    const property esLugarDeInteres
    override method valorFinal() = super() * (1 + 0.2)
    override method esPackPremium() = esLugarDeInteres && self.duracion() > 20 && cantidadDeEscalas == 0
}

class Coordinador {
    var property cantidadViajesRealizados
    const property estaMotivado
    var property  aniosExperiencia
    method esAltamenteCalificado() = cantidadViajesRealizados > 20 
}
class Guia inherits Coordinador{
    override method esAltamenteCalificado() = super() && self.estaMotivado()
}
class AsistenteLogistico inherits Coordinador{
    override method esAltamenteCalificado() = super() && self.aniosExperiencia() > 10
}
class Acompaniante inherits Coordinador{
}


class BeneficioEspecial {
    const property tipo 
    const property costo 
    const estaVigente

    method estaVigente() = estaVigente 
}

// completar