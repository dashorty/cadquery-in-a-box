import cadquery as cq
from cq_server.ui import ui, show_object

show_object(cq.Workplane('XY').box(2, 2, 1))
