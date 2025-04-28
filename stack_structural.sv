module D(
    output wire Q,
    input wire S, 
    input wire C
    ); 
    wire and1, and2, or1, or2, n_s;
    nor or_1(or1, and1, or2),
           or_2(or2, and2, or1);
    and and_1(and1, C, n_s),
           and_2(and2, C, S);
    not ns(n_s, S);
    assign Q = or1;
endmodule

module next_index(input wire [2:0] index, input wire C,
    output wire [2:0] next_index, output wire out_c);
    wire a, b, c;
    assign a = index[2];
    assign b = index[1];
    assign c = index[0];
    assign out_c = c;
    wire oa, ob, oc;
    not first1(n_c, c), nccc(nc, C);
    xor first2(ob, c, b);
    and first3(fa, b, c);
    xor second1(sa, a, fa);
    nand third1(ta, n_c, sa);
    and fourth1 (oa, ta, sa), fourth2 (oc, n_c, ta);
    and ca(a1, oa, C), cb(b1, ob, C), ccc(c1, oc, C),
     nca(a2,a, nc), ncb(b2, b, nc), ncc(c2, c, nc);
    or ans1(aa, a1, a2), ans2(bb, b1, b2), ans3(cc, c1, c2);
    assign next_index[0] = cc;
    assign next_index[1] = bb;
    assign next_index[2] = aa;
endmodule

module last_index(input wire [2:0] index, input wire C,
    output wire[2:0] last_index, output wire out_c);
    wire a, b, c;
    assign a = index[2];
    assign b = index[1];
    assign c = index[0];
    assign out_c = c;
    wire oa, ob, oc;
    not first1(n_c, c), nccc(nc, C);
    nor first2(fa, c, b);
    xor first3(fbb, b, c);
    not qwe(fb, fbb);
    xor second1(oa, a, fa);
    nand third1(ta, n_c, oa);
    and fourth1 (ob, fb, ta), fourth2 (oc, n_c, ta);
    and ca(a1, oa, C), cb(b1, ob, C), cc(c1, oc, C), 
        nca(a2,a, nc), ncb(b2, b, nc), ncc(c2, c, nc);
    or ans1(aa, a1, a2), ans2(bb, b1, b2), ans3(cc, c1, c2);
    assign last_index[0] = cc;
    assign last_index[1] = bb;
    assign last_index[2] = aa;
endmodule

module mex3(input wire in0,
    input wire in1, input wire in2,
    input wire C, output wire out0,
    output wire out1, output wire out2);
    and a1(out0, C, in0), a2(out1, C, in1), a3(out2, C, in2);
endmodule

module mem_index(input wire reset,
    input wire C, input wire[2:0] in_index,
    output wire[2:0] out_index, output wire out_c);
    assign out_c = C;
    wire a, b, c, nr;
    not n(nr, reset);
    and aa(a, in_index[2], nr), bb(b, in_index[1], nr), cc(c, in_index[0], nr);
    D fa(ra, a, C), fb(rb, b, C), fc(rc, c, C);
    assign out_index[2] = ra;
    assign out_index[1] = rb;
    assign out_index[0] = rc;
endmodule

module mux2(input wire num, input wire[2:0] in1,
    input wire[2:0] in2,
    output wire[2:0] out);
    wire [2:0] k, inn1, inn2;
    assign k[2] = num;
    assign k[1] = num;
    assign k[0] = num;
    assign inn1 = k & in1;
    assign inn2 = ~k & in2;
    assign out = inn1 | inn2;
endmodule

module MEX(input wire [2:0]index, 
    input wire num, output wire out1, 
    output wire out2, output wire out3, 
    output wire out4, output wire out5);
    wire a, b, c;
    assign a = index[2];
    assign b = index[1];
    assign c = index[0];
    not aa(na, a), bb(nb, b), cc(nc, c);
    and o1(out1, na, nb, nc, num), o2(out2, na, nb, c, num),
        o3(out3, na, b, nc, num), o4(out4, na, b, c, num),
        o5(out5, a, nb, nc, num);
endmodule

module MUX(input wire [2:0] index, 
    input wire [3:0] in1, input wire [3:0] in2, 
    input wire [3:0] in3, input wire [3:0] in4, 
    input wire [3:0] in5, output wire [3:0] outdata);
    wire a, b, c;
    wire [3:0] k1, k2, k3, k4, k5,
        a1, a2, a3, a4, a5;
    assign a = index[2];
    assign b = index[1];
    assign c = index[0];
    not aa(na, a), bb(nb, b), cc(nc, c);
    and o1(out1, na, nb, nc), o2(out2, na, nb, c),
        o3(out3, na, b, nc), o4(out4, na, b, c),
        o5(out5, a, nb, nc);
    assign k1[0] =  out1;
    assign k1[1] =  out1;
    assign k1[2] =  out1;
    assign k1[3] =  out1;
    assign k2[0] =  out2;
    assign k2[1] =  out2;
    assign k2[2] =  out2;
    assign k2[3] =  out2;
    assign k3[0] =  out3;
    assign k3[1] =  out3;
    assign k3[2] =  out3;
    assign k3[3] =  out3;
    assign k4[0] =  out4;
    assign k4[1] =  out4;
    assign k4[2] =  out4;
    assign k4[3] =  out4;
    assign k5[0] =  out5;
    assign k5[1] =  out5;
    assign k5[2] =  out5;
    assign k5[3] =  out5;
    assign a1 =  k1 & in1;
    assign a2 =  k2 & in2;
    assign a3 =  k3 & in3;
    assign a4 =  k4 & in4;
    assign a5 =  k5 & in5;
    assign outdata = a1 | a2 | a3 | a4 | a5;
endmodule

module memory_cell(input wire [3:0] change, 
    input wire com, input wire reset,
    output wire [3:0] read);
    wire a, b, c, d;
    wire [3:0] k1, k2, k3, k4, k5;
    not(nr, reset);
    and o1(a, change[3], nr);
    and o2(b, change[2], nr);
    and o3(c, change[1], nr);
    and o4(d, change[0], nr);
    or o(clk, reset, com);
    D d1(q1, a, clk), d2(q2, b, clk), 
    d3(q3, c, clk), d4(q4, d, clk);
    assign read[3] = q1;
    assign read[2] = q2;
    assign read[1] = q3;
    assign read[0] = q4;
endmodule

module memory(input wire [3:0] data, 
    input wire [2:0] index, input wire num,
    input wire reset, output wire [3:0] outdata);
    MEX(index, num, out1, out2, out3, out4, out5);
    memory_cell(data, out1, reset, o1);
    memory_cell(data, out2, reset, o2);
    memory_cell(data, out3, reset, o3);
    memory_cell(data, out4, reset, o4);
    memory_cell(data, out5, reset, o5);
    MUX(index, o1, o2, o3, o4, o5, outdata);
endmodule

module mod_for_index(input wire [3:0] in4, output wire [2:0] out3);
    wire a, b, c, d;
    assign a = in4[3];
    assign b = in4[2];
    assign c = in4[1];
    assign d = in4[0];
    not aa(na, a), bb(nb, b), cc(nc, c), dd(nd, d);
    and a1(o1, a, b, c, d), 
    a2(o2, na, b, nc, nd),
    a3(o3, a, b, c, nd),
    a4(o4, na, nb, c, d),
    a5(o5, a, b, nc, d),
    a6(o6, na, nb, c, nd),
    a7(o7, a, b, nc, nd),
    a8(o8, na, nb, nc, d),
    a9(o9, a, nb, c, d),
    a10(o10, na, nb, nc, nd),
    a11(o11, na, b, c, nd),
    a12(o12, na, b, nc, d);
    or b1(n1, o1, o2),
    b2(n2, o3, o4), 
    b3(n3, o5, o6), 
    b4(n4, o7, o8, o11), 
    b5(n5, o9, o10, o12);
    not y1(nn1, n1),
    y2(nn2, n2),
    y3(nn3, n3),
    y4(nn4, n4),
    y5(nn5, n5);
    mex3 p1(nn1, nn1, nn1, c11, c12, c13),
    p2(nn2, nn2, n2, n2, c21, c22, c23),
    p3(nn3, n3, nn3, n3, c31, c32, c33),
    p4(nn4, n4, n4, n4, c41, c42, c43),
    p5(n5, nn5, nn5, n5, c51, c52, c53);
    or u1(f1), u2(f2), u3(f3);
    assign out3[2] = f1;
    assign out3[1] = f2;
    assign out3[0] = f3;
endmodule

module index_get(input wire [2:0] real, 
    input wire [2:0] get, input wire C,
    output wire [2:0] out3);
    wire [2:0] s;
    last_index(real, C, q, s);
    wire a, b, c;
    assign a = s[2];
    assign b = s[1];
    assign c = s[0];
endmodule



module stack_structural_easy(
    output wire[3:0] O_DATA, 
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND, 
    input wire[2:0] INDEX,
    input wire[3:0] I_DATA
    ); 
    

endmodule



module stack_structural_normal(
    inout wire[3:0] IO_DATA, 
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND,
    input wire[2:0] INDEX
    ); 
    
    // put your code here, the other module (stack_structural_easy) must be deleted

endmodule
