import vendedores.*
import certificaciones.*

class Centro {
	const property vendedores = #{}
	var property ciudad 
	
	method agregarVendedor(unVendedor){
		if (vendedores.contains(unVendedor)){
			self.error("El vendedor ya está registrado.")
		}
		vendedores.add(unVendedor)
		
	}	
	method vendedorEstrella()= vendedores.max({v => v.puntosTotales()})
	method puedeCubrir(unaCiudad)= vendedores.any({v=> v.puedeTrabajarEn(unaCiudad)})
	method vendedoresGenericos()= vendedores.filter({v=> v.esGenerico()}) 
	method esRobusto()= vendedores.count({v => v.esFirme()}) >= 3
	
	method repartirCertificacion(unaCertificacion){
		vendedores.forEach({v=> v.agregarCertificacion(unaCertificacion)})
	}
 	
}



