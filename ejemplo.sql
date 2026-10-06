--ejercicio_1--

CREATE OR REPLACE PACKAGE pkg_panel_emprendedor IS

function fn_pedidos_por_preparar(
    p_emprendimiento_id IN pedido.emprendimiento_is%TYpe
) return varchar2

Is
    v_sql varchar2(4000)

begin 
    v_sql := 'SELECT P'

END;
END;

/

SELECT P.PEDIDO_ID, C.NOMBRE, TO_CHAR(p.fecha_pedido, 'DD/MM/YYYY'),
p.estado
pedido p,
((SELECT sum(dp.cantidad*dp.precio_unitario)
from detalle_pedido dp
where dp.pedido_id = p.pedido_id),0) as total
FROM pedido P
JOIN cliente c ON C.CLIENTE_ID = P.CLIENTE_ID
WHERE P.EMPRENDIMIENTO_ID = 1 
AND P.ESTADO IN ('PENDIENTE', 'EN PREPARACION', 'CONFIRMADO')
ORDER BY P.FECHA_PEDIDO;