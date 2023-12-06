CREATE DATABASE coordinadora;
USE coordinadora;
CREATE TABLE `pedido`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `IdUsuarioFk` INT NOT NULL,
    `Descripcion` VARCHAR(255) NOT NULL,
    `IdenvioFk` INT NOT NULL
);
CREATE TABLE `empleado`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `direccion` VARCHAR(255) NOT NULL,
    `Idciudadfk` INT NOT NULL
);
CREATE TABLE `detallepedido`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `preciounitario` DOUBLE NOT NULL,
    `IdpedidoFk` INT NOT NULL
);
CREATE TABLE `envio`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Descripcion` VARCHAR(255) NOT NULL,
    `duracion` VARCHAR(255) NOT NULL,
    `IdtipoenvioFk` INT NOT NULL
);
CREATE TABLE `tipopago`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL
);
CREATE TABLE `estado`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Fechapedido` DATE NOT NULL,
    `Fechaesperada` DATE NOT NULL,
    `Fechaentrega` DATE NOT NULL,
    `IdpedidoFk` INT NOT NULL
);
CREATE TABLE `usuario`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `telefono` VARCHAR(255) NOT NULL,
    `Direccion` VARCHAR(255) NOT NULL,
    `IdCiudadFk` INT NOT NULL
);
CREATE TABLE `tipoEnvio`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipoenvio` VARCHAR(255) NOT NULL
);
CREATE TABLE `ciudad`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `IdDepartamentoFk` INT NOT NULL
);
CREATE TABLE `pago`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `IdproductoFk` INT NOT NULL,
    `valortotal` DOUBLE NOT NULL,
    `IdtipopagoFk` INT NOT NULL
);
CREATE TABLE `pais`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL
);
CREATE TABLE `ruta`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `puntoorigen` VARCHAR(255) NOT NULL,
    `puntodestino` VARCHAR(255) NOT NULL,
    `IdpedidoFk` BIGINT NOT NULL
);
CREATE TABLE `producto`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Descripcion` VARCHAR(255) NOT NULL,
    `proveedor` VARCHAR(255) NOT NULL,
    `precio` DOUBLE NOT NULL,
    `cantidad` INT NOT NULL,
    `IdpedidoFk` INT NOT NULL,
    `preciototal` INT NOT NULL,
    `IdtipoproductoFk` INT NOT NULL
);
CREATE TABLE `tipoProducto`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `departamento`(
    `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `IdPaisFk` INT NOT NULL
);
ALTER TABLE
    `usuario` ADD CONSTRAINT `usuario_idciudadfk_foreign` FOREIGN KEY(`IdCiudadFk`) REFERENCES `ciudad`(`Id`);
ALTER TABLE
    `pago` ADD CONSTRAINT `pago_idproductofk_foreign` FOREIGN KEY(`IdproductoFk`) REFERENCES `producto`(`Id`);
ALTER TABLE
    `departamento` ADD CONSTRAINT `departamento_idpaisfk_foreign` FOREIGN KEY(`IdPaisFk`) REFERENCES `pais`(`Id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_idenviofk_foreign` FOREIGN KEY(`IdenvioFk`) REFERENCES `envio`(`Id`);
ALTER TABLE
    `estado` ADD CONSTRAINT `estado_idpedidofk_foreign` FOREIGN KEY(`IdpedidoFk`) REFERENCES `pedido`(`Id`);
ALTER TABLE
    `detallepedido` ADD CONSTRAINT `detallepedido_idpedidofk_foreign` FOREIGN KEY(`IdpedidoFk`) REFERENCES `pedido`(`Id`);
ALTER TABLE
    `ruta` ADD CONSTRAINT `ruta_idpedidofk_foreign` FOREIGN KEY(`IdpedidoFk`) REFERENCES `pedido`(`Id`);
ALTER TABLE
    `empleado` ADD CONSTRAINT `empleado_idciudadfk_foreign` FOREIGN KEY(`Idciudadfk`) REFERENCES `ciudad`(`Id`);
ALTER TABLE
    `ciudad` ADD CONSTRAINT `ciudad_iddepartamentofk_foreign` FOREIGN KEY(`IdDepartamentoFk`) REFERENCES `departamento`(`Id`);
ALTER TABLE
    `producto` ADD CONSTRAINT `producto_idpedidofk_foreign` FOREIGN KEY(`IdpedidoFk`) REFERENCES `pedido`(`Id`);
ALTER TABLE
    `envio` ADD CONSTRAINT `envio_idtipoenviofk_foreign` FOREIGN KEY(`IdtipoenvioFk`) REFERENCES `tipoEnvio`(`Id`);
ALTER TABLE
    `pago` ADD CONSTRAINT `pago_idtipopagofk_foreign` FOREIGN KEY(`IdtipopagoFk`) REFERENCES `tipopago`(`Id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_idusuariofk_foreign` FOREIGN KEY(`IdUsuarioFk`) REFERENCES `usuario`(`Id`);
ALTER TABLE
    `producto` ADD CONSTRAINT `producto_idtipoproductofk_foreign` FOREIGN KEY(`IdtipoproductoFk`) REFERENCES `tipoProducto`(`Id`);