import math

inner_radius = 10
outer_radius = 40
arc_radius   = 25
num_segments = 8
offset       = 45

def svg_prolog():
    print('''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg width="1000" height="1000" viewBox="-100 -100 200 200" xmlns="http://www.w3.org/2000/svg">
''')

def svg_epilog():
        print('</svg>')

def svg_segment(x0, y0, x1, y1, x2, y2, x3, y3, ri, ro, ra):
    segment = '''
<path d="M {0} {1}
    A {10} {10} 0 0 1 {2} {3}
    A {8} {8} 0 0 0 {4} {5}
    A {10} {10} 0 0 0 {6} {7}
    A {9} {9} 0 0 1 {0} {1}"
    stroke="white" fill="black" stroke-width="1" stroke-opacity="1.0"/>
    '''.format(x0, y0, x1, y1, x2, y2, x3, y3, ri, ro, ra)
    #          0   1   2   3   4   5   6   7   8   9   10

    print(segment)


svg_prolog()

for n in range(num_segments):
    step  = -2 * math.pi / num_segments
    angle = n * 2 * math.pi / num_segments
    ofs   = 2 * math.pi * offset / 360

    x0 = math.cos( angle ) * outer_radius
    y0 = math.sin( angle ) * outer_radius
    x1 = math.cos( angle + ofs ) * inner_radius
    y1 = math.sin( angle + ofs ) * inner_radius
    x2 = math.cos( angle + ofs + step ) * inner_radius
    y2 = math.sin( angle + ofs + step ) * inner_radius
    x3 = math.cos( angle + step ) * outer_radius
    y3 = math.sin( angle + step ) * outer_radius
    svg_segment(x0, y0, x1, y1, x2, y2, x3, y3, inner_radius, outer_radius, arc_radius)

svg_epilog()

