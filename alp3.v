module dss;
wire [0:0] k1;
wire [0:0] k2;
wire [8:0] X;
wire [40:0] A;
wire [11:0] B;
wire [8:1] Z;
wire [32:0] V;
wire [16:0] C;
wire [16:0] N;
wire [0:0] vs;
wire [15:0] fg;
wire [15:0] ex;
wire [15:0] c;
wire [15:0] gf;
wire [2:1] mgg;
wire [2:1] AAA;
wire fff;
wire [0:0] M;
wire [0:0] g;
wire [0:0] exx1;
wire [0:0] exx2;
wire [7:0] al;
wire [7:0] bl;
assign g = 1;
assign J = 1;
assign ggg = 0;


reg [7:0] s = 45;  //unput :) left
reg [7:0] d = 90; //unput :) right
assign mgg[1] = 1;  //set 1 if wont minus left number
assign mgg[2] = 0;  //set 1 if wont minus right number

assign M = mgg[1] ^ mgg[2];

//compilator
assign gh1 = d[0]; //right most bit
assign gh2 = d[1];
assign gh3 = d[2];
assign gh4 = d[3];    //left number
assign gh5 = d[4];
assign gh6 = d[5];
assign gh7 = d[6];
assign gh8 = d[7]; //left most bit

assign gf1 = s[0];  //right most bit
assign gf2 = s[1];
assign gf3 = s[2];
assign gf4 = s[3];
assign gf5 = s[4];    //right number
assign gf6 = s[5];
assign gf7 = s[6];
assign gf8 = s[7]; //left most bit

//what bigger module
//end

and ca29 (c[14] ,d[7] ,gf[15]);
and ca30 (c[15] ,s[7] ,gf[15] );
and sa31 (fg[14] ,gf[14] ,gf[15]);
and sa32 (fg[15] ,c[14] ,c[15]);
nor co15 (gf[14] ,c[14] ,c[15]);
or co16 (gf[15] ,g ,J);
xor fr15 (ex[14] ,fg[15] ,c[14]);
xor fr16 (ex[15] ,fg[15] ,c[15]);

and ca25 (c[12] ,d[6] ,gf[13]);
and ca26 (c[13] ,s[6] ,gf[13]);
and sa27 (fg[12] ,gf[12] ,gf[13]);
and sa28 (fg[13] ,c[12] ,c[13]);
nor co13 (gf[12] ,c[12] ,c[13]);
or co14 (gf[13] ,fg[14] ,fg[15]);
xor fr13 (ex[12] ,fg[13] ,c[12]);
xor fr14 (ex[13] ,fg[13] ,c[13]);

and ca21 (c[10] ,d[5] ,gf[11]);
and ca22 (c[11] ,s[5] ,gf[11]);
and sa23 (fg[10] ,gf[10] ,gf[11]);
and sa24 (fg[11] ,c[10] ,c[11]);
nor co11 (gf[10] ,c[10] ,c[11]);
or co12 (gf[11] ,fg[12] ,fg[13]);
xor fr11 (ex[10] ,fg[11] ,c[10]);
xor fr12 (ex[11] ,fg[11] ,c[11]);

and ca17 (c[8] ,d[4] ,gf[9]);
and ca18 (c[9] ,s[4] ,gf[9]);
and sa19 (fg[8] ,gf[8] ,gf[9]);
and sa20 (fg[9] ,c[8] ,c[9]);
nor co9 (gf[8] ,c[8] ,c[9]);
or co10 (gf[9] ,fg[10] ,fg[11]);
xor fr9 (ex[8] ,fg[9] ,c[8]);
xor fr10 (ex[9] ,fg[9] ,c[9]);

and ca13 (c[6] ,d[3] ,gf[7]);
and ca14 (c[7] ,s[3] ,gf[7]);
and sa15 (fg[6] ,gf[6] ,gf[7]);
and sa16 (fg[7] ,c[6] ,c[7]);
nor co7 (gf[6] ,c[6] ,c[7]);
or co8 (gf[7] ,fg[8] ,fg[9]);
xor fr7 (ex[6] ,fg[7] ,c[6]);
xor fr8 (ex[7] ,fg[7] ,c[7]);

and ca9 (c[4] ,d[2] ,gf[5]);
and ca10 (c[5] ,s[2] ,gf[5]);
and sa11 (fg[4] ,gf[4] ,gf[5]);
and sa12 (fg[5] ,c[4] ,c[5]);
nor co5 (gf[4] ,c[4] ,c[5]);
or co6 (gf[5] ,fg[6] ,fg[7]);
xor fr5 (ex[4] ,fg[5] ,c[4]);
xor fr6 (ex[5] ,fg[5] ,c[5]);

and ca5 (c[2] ,d[1] ,gf[3]);
and ca6 (c[3] ,s[1] ,gf[3]);
and sa7 (fg[2] ,gf[2] ,gf[3]);
and sa8 (fg[3] ,c[2] ,c[3]);
nor co3 (gf[2] ,c[2] ,c[3]);
or co4 (gf[3] ,fg[4] ,fg[5]);
xor fr3 (ex[2] ,fg[3] ,c[2]);
xor fr4 (ex[3] ,fg[3] ,c[3]);

and ca1 (c[0] ,d[0] ,gf[1]);
and ca2 (c[1] ,s[0] ,gf[1]);
and sa3 (fg[0] ,gf[0] ,gf[1]);
and sa4 (fg[1] ,c[0] ,c[1]);
nor co1 (gf[0] ,c[0] ,c[1]);
nor co2 (gf[1] ,fg[2] ,fg[3]);
xor fr1 (ex[0] ,fg[1] ,c[0]);
xor fr2 (ex[1] ,fg[1] ,c[1]);





xor AAA1 (exx1 ,ex[0] ,ex[2] ,ex[4] ,ex[6] ,ex[8] ,ex[10] ,ex[12] ,ex[14]);
xor AAA2 (exx2 ,ex[1] ,ex[3] ,ex[5] ,ex[7] ,ex[9] ,ex[11] ,ex[13] ,ex[15]);

and mf1 (vs[0] ,exx2 ,mgg[2]);

nand k1v (k1 ,vs[0] ,J);
nor k2v (k2 ,k1 ,ggg); 

assign al = (d & {8{k1}}) | (s & {8{k2}});
assign bl = (s & {8{k1}}) | (d & {8{k2}});

//ALP
and b01 (B[0] ,M ,g);
xor a01 (A[2] ,bl[0],M);
and a02 (A[0] ,al[0] ,g);
or al1 (X[1] ,A[3] ,A[4] ,A[5]);
and t1 (A[3] ,A[0] , A[2]);
and t2 (A[4] ,A[0] ,B[0]);
and t3 (A[5] ,A[2] ,B[0]);
xor c01 (Z[1] ,B[0] ,A[2] ,A[0]); //exit

and b02 (B[1] , X[1] ,g);
xor a03 (A[7] ,bl[1],M);
and a04 (A[6] ,al[1] ,g);
or al2 (X[2] ,A[8] ,A[9] ,A[10]);
and t4 (A[8] ,A[7] , A[6]);
and t5 (A[9] ,A[6] ,B[1]);
and t6 (A[10] ,A[7] ,B[1]);
xor c02 (Z[2] ,B[1] ,A[7] ,A[6]); //exit

and b03 (B[2] , X[2] ,g);
xor a05 (A[12] ,bl[2],M);
and a06(A[11] ,al[2] ,g);
or al3 (X[3] ,A[13] ,A[14] ,A[15]);
and t7 (A[13] ,A[11] , A[12]);
and t8 (A[14] ,A[11] ,B[2]);
and t9 (A[15] ,A[12] ,B[2]);
xor c03 (Z[3] ,B[2] ,A[12] ,A[11]); //exit

and b04 (B[3] , X[3] ,g);
xor a07 (A[17] ,bl[3],M);
and a08 (A[16] ,al[3] ,g);
or al4 (X[4] ,A[18] ,A[19] ,A[20]);
and t10 (A[18] ,A[16], A[17]);
and t11 (A[19] ,A[16] ,B[3]);
and t12 (A[20] ,A[17] ,B[3]);
xor c04 (Z[4] ,B[3] ,A[17] ,A[16]); //exit

and b05 (B[4] , X[4] ,g);
xor a09 (A[22] ,bl[4],M);
and a010 (A[21] ,al[4] ,g);
or al5 (X[5] ,A[23] ,A[24] ,A[25]);
and t13 (A[23] ,A[21] , A[22]);
and t14 (A[24] ,A[21] ,B[4]);
and t15 (A[25] ,A[22] ,B[4]);
xor c05 (Z[5] ,B[4] ,A[22] ,A[21]); //exit
 
and b06 (B[5] , X[5] ,g);
xor a011 (A[27] ,bl[5],M);
and a012 (A[26] ,al[5] ,g);
or al6 (X[6] ,A[28] ,A[29] ,A[30]);
and t16 (A[28] ,A[26] , A[27]);
and t17 (A[29] ,A[26] ,B[5]);
and t18 (A[30] ,A[27] ,B[5]);
xor c06 (Z[6] ,B[5] ,A[27] ,A[26]); //exit

and b07 (B[6] , X[6] ,g);
xor a013 (A[32] ,bl[6],M);
and a014 (A[31] ,al[6] ,g);
or al7 (X[7] ,A[33] ,A[34] ,A[35]);
and t19 (A[33] ,A[31] , A[32]);
and t20 (A[34] ,A[31] ,B[6]);
and t21 (A[35] ,A[32] ,B[6]);
xor c07 (Z[7] ,B[6] ,A[32] ,A[31]); //exit

and b08 (B[7] , X[7] ,g);
xor a015 (A[37],bl[7],M);
and a016 (A[36] ,al[7] ,g);
or al8 (X[8] ,A[38] ,A[39] ,A[40]);
and t22 (A[38] ,A[36] , A[37]);
and t23 (A[39] ,A[36] ,B[7]);
and t24 (A[40] ,A[37] ,B[7]);
xor c08 (Z[8] ,B[7] ,A[37] ,A[36]); //exit

assign fff = (exx2 & mgg[2]) ^ (exx1 & mgg[1]) ^ M;

initial begin
    #1;
$display("help info");
 $display("vs = %d", vs);
$display("fff = %d", fff);
$display("exx2 = %d", exx2);
$display("exx1 = %d", exx1);
$display("k1 = %d", k1);
$display("k2 = %d", k2);
$display("M = %d", M);
$display("lol");
$display("al = %d", al);
$display("bl = %d", bl);
 if (fff == 1) begin
$display("output = -%d", Z);
end
 if (fff == 0) begin
$display("output = %d", Z);
end
#3000;
$finish;
end
endmodule