CREATE TABLE `pedido`(
    `Id` INT NOT NULL,
    `IdUsuarioFk` INT NOT NULL,
    `Descripcion` VARCHAR(255) NOT NULL,
    `IdenvioFk` INT NOT NULL
);
CREATE TABLE `empleado`(
    `Id` BIGINT  NOT NULL,
    `nombre` VARCHAR(255) NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `direccion` VARCHAR(255) NOT NULL,
    `Idciudadfk` INT NOT NULL
);
CREATE TABLE `detallepedido`(
    `Id` INT NOT NULL ,
    `cantidad` INT NOT NULL,
    `preciounitario` DOUBLE NOT NULL,
    `IdpedidoFk` INT NOT NULL
);
CREATE TABLE `envio`(
    `Id` INT NOT NULL ,
    `Descripcion` VARCHAR(255) NOT NULL,
    `duracion` VARCHAR(255) NOT NULL,
    `IdtipoenvioFk` INT NOT NULL
);
CREATE TABLE `tipopago`(
    `Id` INT  NOT NULL ,
    `nombre` VARCHAR(255) NOT NULL
);
CREATE TABLE `estado`(
    `Id` INT  NOT NULL ,
    `Fechapedido` DATE NOT NULL,
    `Fechaesperada` DATE NOT NULL,
    `Fechaentrega` DATE NOT NULL,
    `IdpedidoFk` INT NOT NULL
);
CREATE TABLE `usuario`(
    `Id` INT  NOT NULL  ,
    `nombre` VARCHAR(255) NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `telefono` VARCHAR(255) NOT NULL,
    `Direccion` VARCHAR(255) NOT NULL,
    `IdCiudadFk` INT NOT NULL
);
CREATE TABLE `tipoEnvio`(
    `Id` INT  NOT NULL  ,
    `tipoenvio` VARCHAR(255) NOT NULL
);
CREATE TABLE `ciudad`(
    `Id` INT  NOT NULL ,
    `nombre` VARCHAR(255) NOT NULL,
    `IdDepartamentoFk` INT NOT NULL
);
CREATE TABLE `pago`(
    `Id` INT  NOT NULL ,
    `IdproductoFk` INT NOT NULL,
    `valortotal` DOUBLE NOT NULL,
    `IdtipopagoFk` INT NOT NULL
);
CREATE TABLE `pais`(
    `Id` INT NOT NULL ,
    `nombre` VARCHAR NOT NULL
);
CREATE TABLE `ruta`(
    `Id` INT NOT NULL ,
    `puntoorigen` VARCHAR NOT NULL,
    `puntodestino` VARCHAR NOT NULL,
    `IdpedidoFk` BIGINT NOT NULL
);
CREATE TABLE `producto`(
    `Id` INT NOT NULL,
    `Descripcion` VARCHAR NOT NULL,
    `proveedor` VARCHAR NOT NULL,
    `precio` DOUBLE NOT NULL,
    `cantidad` INT NOT NULL,
    `IdpedidoFk` INT NOT NULL,
    `preciototal` INT NOT NULL,
    `IdtipoproductoFk` INT NOT NULL
);
CREATE TABLE `tipoProducto`(
    `Id` INT  NOT NULL 
);
CREATE TABLE `departamento`(
    `Id` INT NOT NULL,
    `nombre` VARCHAR NOT NULL,
    `IdPaisFk` INT NOT NULL
);