import certificaciones.*
import ciudades.*
import centrosDeDistribucion.*
class Fijo {
	const property ciudad 
	const property certificaciones = #{}
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	method provincia()= ciudad.provincia()
	method puedeTrabajarEn(unaCiudad)= ciudad == unaCiudad
	method esVersatil()= certificaciones.size() >= 3 and
		certificaciones.any({c => c.esDeProducto()}) and
		self.esGenerico()
	method esInfluyente()=  false
	method esFirme()= self.puntosTotales() >= 30
	method puntosTotales()= certificaciones.sum({c=> c.puntos()})
	method esGenerico()= certificaciones.any({c => not c.esDeProducto()})
	method tieneAfinidadCon(centro)= self.puedeTrabajarEn(centro.ciudad())
	method esCandidato(centro)= self.esVersatil() and self.tieneAfinidadCon(centro)
	method esFisico()= true
}

class Viajante {
	const property provincias = #{}
	const property certificaciones = #{}
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	method puedeTrabajarEn(unaCiudad)= provincias.contains(unaCiudad.provincia())
	method esVersatil()= certificaciones.size() >= 3 and
		certificaciones.any({c => c.esDeProducto()}) and
		self.esGenerico()
	method esFirme()= self.puntosTotales() >= 30
	method puntosTotales()= certificaciones.sum({c=> c.puntos()})
	method esInfluyente()= provincias.sum({p => p.poblacion()}) >= 10000000
	method esGenerico()= certificaciones.any({c => not c.esDeProducto()})
	method tieneAfinidadCon(centro)= self.puedeTrabajarEn(centro.ciudad()) 
	method esCandidato(centro)= self.esVersatil() and self.tieneAfinidadCon(centro)
	method esFisico()= true
}

class Comercio {
	const property ciudadesConSucursal = #{}
	const property certificaciones = #{}	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	method puedeTrabajarEn(unaCiudad)= ciudadesConSucursal.contains(unaCiudad)
	method esVersatil()= certificaciones.size() >= 3 and
		certificaciones.any({c => c.esDeProducto()}) and
		self.esGenerico()
	method esFirme()= self.puntosTotales() >= 30
	method puntosTotales()= certificaciones.sum({c=> c.puntos()})
	method esInfluyente()= ciudadesConSucursal.size() >= 5 or 
		ciudadesConSucursal.map({c => c.provincia()}).asSet().size() >= 3
	method esGenerico()= certificaciones.any({c => not c.esDeProducto()})
	method tieneAfinidadCon(centro)= self.puedeTrabajarEn(centro.ciudad()) and
		ciudadesConSucursal.any({c=> not centro.puedeCubrir(c)})
	method esCandidato(centro)= self.esVersatil() and self.tieneAfinidadCon(centro)
	method esFisico()= false
}
