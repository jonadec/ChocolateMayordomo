CREATE DATABASE ChocolateMayordomo;


USE ChocolateMayordomo;

CREATE TABLE Direcciones (
    direccion_id INT PRIMARY KEY,
    Calle VARCHAR(100),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50)
);

INSERT INTO Direcciones (direccion_id, Calle, Ciudad, Pais) VALUES
(1, 'Avenida de los Robles', 'Tuxtla Gutierrez', 'Mexico'),
(2, 'Calle del Sol', 'Oaxaca de Juarez', 'Mexico'),
(3, 'Paseo de la Luna', 'Oaxaca de Juarez', 'Mexico'),
(4, 'Avenida de los Pinos', 'Villahermosa', 'Mexico'),
(5, 'Callejon de las Flores', 'Merida', 'Mexico'),
(6, 'Paseo del Mar', 'Acapulco', 'Mexico'),
(7, 'Arteaga', 'Oaxaca de Juarez', 'Mexico'),
(8, 'Jose Maria de la Vega', 'Oaxaca de Juarez', 'Mexico'),
(9, 'Paseo del Bosque', 'Chiapa de Corzo', 'Mexico'),
(10, 'Avenida de los Cerezos', 'Tapachula', 'Mexico');

CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Tipo VARCHAR(50),
    Precio DECIMAL(8, 2)
);


INSERT INTO Productos (producto_id, Nombre, Tipo, Precio) VALUES
(1, 'Bebida de chocolate caliente', 'Bebida', 34.99),
(2, 'Bebida de chocolate fría', 'Bebida', 28.99),
(3, 'Bebida de chocolate con menta', 'Bebida', 39.99),
(4, 'Bebida de chocolate con caramelo', 'Bebida', 36.49),
(5, 'Bebida de chocolate con avellanas', 'Bebida', 39.99),
(6, 'Chocolate en polvo tradicional', 'Polvo', 49.99),
(7, 'Chocolate en polvo sin azúcar', 'Polvo', 41.99),
(8, 'Chocolate en polvo con canela', 'Polvo', 52.49),
(9, 'Chocolate en polvo con nueces', 'Polvo', 54.99),
(10, 'Chocolate en polvo con fresa', 'Polvo', 47.99);

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Correo VARCHAR(100),
    direccion_id INT,
    FOREIGN KEY (direccion_id) REFERENCES Direcciones(direccion_id)
);


INSERT INTO Clientes (cliente_id, Nombre, Apellido, Correo, direccion_id) VALUES
(1, 'Juan', 'Aragon', 'juan.perez@gmail.com', 1),
(2, 'Maria', 'Gomez', 'maria.gomez@gmail.com', 2),
(3, 'Luis', 'Hernandez', 'luis.hernandez@gmail.com', 3),
(4, 'Ana', 'Martinez', 'ana.martinez@gmail.com', 4),
(5, 'Carlos', 'Lopez', 'carlos.lopez@gmail.com', 5),
(6, 'Laura', 'Rodriguez', 'laura.rodriguez@gmail.com', 6),
(7, 'Pedro', 'Garcia', 'pedro.garcia@gmail.com', 7),
(8, 'Sofia', 'Torres', 'sofia.torres@gmail.com', 8),
(9, 'Diego', 'Ortega', 'diego.ortega@gmail.com', 9),
(10, 'Marta', 'Vargas', 'marta.vargas@gmail.com', 10);

CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    direccion_id INT,
    Telefono VARCHAR(15),
    FOREIGN KEY (direccion_id) REFERENCES Direcciones(direccion_id)
);

INSERT INTO Empleados (empleado_id, Nombre, direccion_id, Telefono) VALUES
(1, 'Ricardo', 2, '951-124-4567'),
(2, 'Isabella', 2, '951-987-6543'),
(3, 'Gabriel', 3, '951-556-7890'),
(4, 'Valentina', 4, '951-789-0123'),
(5, 'Javier', 5, '951-234-5678'),
(6, 'Camila', 6, '951-567-8901'),
(7, 'Emilio', 4, '951-893-1234'),
(8, 'Alejandra', 8, '951-321-6547'),
(9, 'Andres', 9, '951-654-9870'),
(10, 'Carolina', 1, '951-987-3216');



CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY,
    cliente_id INT,
    empleado_id INT,
    producto_id INT,
    Cantidad INT,
    FechaVenta DATE,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);


INSERT INTO Ventas ( venta_id, cliente_id, empleado_id, producto_id, Cantidad, FechaVenta) VALUES
(1, 1, 3, 2, 4, '2023-05-01'),
(2, 3, 2, 5, 1, '2023-05-01'),
(3, 2, 1, 9, 3, '2023-05-03'),
(4, 4, 4, 6, 2, '2023-05-04'),
(5, 7, 6, 1, 1, '2023-05-05'),
(6, 5, 5, 8, 2, '2023-05-05'),
(7, 6, 7, 3, 5, '2023-05-07'),
(8, 8, 8, 4, 3, '2023-05-08'),
(9, 10, 10, 7, 2, '2023-05-08'),
(10, 7, 2, 7, 1, '2023-05-08'),
(11, 4, 4, 2, 3, '2023-05-09'),
(12, 9, 8, 4, 5, '2023-05-09'),
(13, 3, 10, 2, 2, '2023-05-10'),
(14, 2, 7, 2, 1, '2023-05-10'),
(15, 9, 5, 5, 2, '2023-05-10');


