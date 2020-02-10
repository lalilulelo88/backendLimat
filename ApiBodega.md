# ApiBodega
Ya se enceunra desplegado en Heroku. https://bodegalimat.herokuapp.com

# Consultas:

### Guias:

- Obtener todas las Guias pendientes
```sh
GET: https://bodegalimat.herokuapp.com/guias
```
- Obtener Guia
```sh
GET: https://bodegalimat.herokuapp.com/guias/<IDGUIA>
```
- Actualizar Guia
```sh
PUT: https://bodegalimat.herokuapp.com/guias/<IDGUIA>
BODY: objeto guia.estado
```

### Pallets:

- Obtener todos las Pallets
```sh
GET: https://bodegalimat.herokuapp.com/pallets
```
- Obtener todos las Pallets de una Guia
```sh
GET: https://bodegalimat.herokuapp.com/pallets/guia/<IDGUIA>
```
- Obtener Pallet
```sh
GET: https://bodegalimat.herokuapp.com/pallets/<IDPALLET>
```
- Actualizar Pallet
```sh
PUT: https://bodegalimat.herokuapp.com/pallets/<IDPALLET>
BODY: objeto pallet.estado,pallet.posicion
```