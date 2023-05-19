import vendedores.*
import certificaciones.*

class ClienteInseguro{
	
	method	puedeSerAtendidoPor(vendedor)= 
		vendedor.esVersatil() and vendedor.esFirme()
}

class ClienteDetallista{
	
	method	puedeSerAtendidoPor(vendedor)= 
		vendedor.certificaciones().count({c=> c.esDeProducto()}) >= 3
}

class ClienteHumanista{
	
	method	puedeSerAtendidoPor(vendedor)= vendedor.esFisico()
}