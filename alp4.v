module dss;
wire [8:0] X;
wire [40:0] A;
wire [11:0] B;
wire [8:1] Z;
wire [32:0] V;
wire [16:0] C;
wire [16:0] N;
wire [15:0] fg;
wire [15:0] ex;
wire [15:0] c;
wire [15:0] gf;
wire [2:1] mgg;
wire [2:1] AAA;
wire [7:0] al;
wire [7:0] bl;
wire [4:0] bf;
wire [5:0] mode1;
wire [6:0] mode;
wire [7:0] d;
wire [7:0] s;
wire [7:0] ct;
wire [7:0] ct1;
wire [7:0] cm;
wire [7:0] cm1;

assign ct = 3; //left number
assign ct1 = 4; //right number
assign st = 3;
assign mode = 3;

assign m1 = 0; // set 1 if minus left number
assign m2 = 0; //set 1 if minus right number

assign mode1[5:0] = ~mode[5:0];
assign bf[0] = mode[0] & mode1[1] & mode1[2] & if1; //instruc
assign bf[1] = mode1[0] & mode[1] & mode1[2];      //if
assign bf[2] = mode[0] & mode[1] & mode1[2] & if1; //buffer input
assign bf[3] = mode1[0] & mode1[1] & mode[2] & if1; //jump
assign bf[4] = mode[0] & mode[1] & mode[2] & if1; //change prog

assign d[7:0] = ct[7:0] & {8{bf[2]}};
assign s[7:0] = ct1[7:0] & {8{bf[2]}}; //buffer
assign mgg = m1 & bf[2];  
assign mgg1 = m2 & bf[2];

assign cm[7:0] = ct[7:0] & {8{bf[0]}};
assign cm1[7:0] = ct1[7:0] & {8{bf[0]}};   //instruc

assign if2 = Z[7:0] ^ (ct[7:0] & {8{bf[1]}});   //if
assign if1 = ~mode[6] ^ (~if2 & mode[6]);

assign M = mgg ^ mgg1;

//what bigger module
assign c[14] = d[7] & gf[15];
assign c[15] = s[7] & gf[15];
assign fg[14] = gf[14] & gf[15];
assign fg[15] = c[14] & c[15];
assign fg[14] = ~(c[14] & c[15]);
assign gf[15] = 1;
assign ex[14] = fg[15] ^ c[14];
assign ex[15] = fg[15] ^ c[15];

assign c[12] = d[6] & gf[13];
assign c[13] = s[6] & gf[13];
assign fg[12] = gf[12] & gf[13];
assign fg[13] = c[12] & c[13];
assign gf[12] = ~(c[12] | c[13]);
assign gf[13] = fg[14] | fg[15];
assign ex[12] = fg[13] ^ c[12];
assign ex[13] = fg[13] ^ c[13];

assign c[10] = d[5] & gf[11];
assign c[11] = s[5] & gf[11];
assign fg[10] = gf[10] & gf[11];
assign fg[11] = c[10] & c[11];
assign gf[10] = ~(c[10] & c[11]);
assign gf[11] = fg[12] | fg[13];
assign ex[10] = fg[11] ^ c[10];
assign ex[11] = fg[11] ^ c[11];

assign c[8] = d[4]  & gf[9];
assign c[9] = s[4]  & gf[9];
assign fg[8] = gf[8] & gf[9];
assign fg[9] = c[8] & c[9];
assign gf[8] = ~(c[8] | c[9]);
assign gf[9] = fg[10] | fg[11];
assign ex[8] = fg[9] ^ c[8];
assign ex[9] = fg[9] ^ c[9];

assign c[6] = d[3] & gf[7];
assign c[7] = s[3] & gf[7];
assign fg[6] = gf[6] & gf[7];
assign fg[7] = c[6] & c[7];
assign gf[6] = ~(c[6] | c[7]);
assign gf[7] = fg[8] | fg[9];
assign ex[6] = fg[7] ^ c[6];
assign ex[7] = fg[7] ^ c[7];

assign c[4] = d[2] & gf[5];
assign c[5] = s[2] & gf[5];
assign fg[4] = gf[4] & gf[5];
assign fg[5] = c[4] & c[5];
assign gf[4] = ~(c[4] | c[5]);
assign gf[5] = fg[6] | fg[7];
assign ex[4] = fg[5] ^ c[4];
assign ex[5] = fg[5] ^ c[5];

assign c[2] = d[1] & gf[3];
assign c[3] = s[1] & gf[3];
assign fg[2] = gf[2] & gf[3];
assign fg[3] = c[2] & c[3];
assign gf[2] = ~(c[2] | c[3]);
assign gf[3] = fg[4] | fg[5];
assign ex[2] = fg[3] ^ c[2];
assign ex[3] = fg[3] ^ c[3];

assign c[0] = d[0] & gf[1];
assign c[1] = s[0] & gf[1];
assign fg[0] = gf[0] & gf[1];
assign fg[1] = c[0] & c[1];
assign gf[0] = ~(c[0] | c[1]);
assign gf[1] = fg[2] | fg[3];
assign ex[0] = fg[1] ^ c[0];
assign ex[1] = fg[1] ^ c[1];


assign exx1 = ex[0] ^ ex[2] ^ ex[4] ^ ex[6] ^ ex[8] ^ ex[10] ^ ex[12] ^ ex[14];
assign exx2 = ex[1] ^ ex[3] ^ ex[5] ^ ex[7] ^ ex[9] ^ ex[11] ^ ex[13] ^ ex[15];

assign vs = & exx2 & mgg1;

assign k1 = ~(vs);
assign k2 = ~(k1); 

assign al = (d & {8{k1}}) | (s & {8{k2}});
assign bl = (s & {8{k1}}) | (d & {8{k2}});
//ALP
assign B[0] = M;
assign A[2] = bl[0] ^ M;
assign A[0] = al[0];
assign X[1] = A[3] | A[4] | A[5];
assign A[3] = A[0] & A[2];
assign A[4] = A[0] & B[0];
assign A[5] = A[2] & B[0];
assign Z[1] = B[0] ^ A[2] ^ A[0]; //exit

assign B[1] = X[1];
assign A[7] = bl[1] ^ M;
assign A[6] = al[1];
assign X[2] = A[8] | A[9] | A[10];
assign A[8] = A[7] & A[6];
assign A[9] = A[6] & B[1];
assign A[10] = A[7] & B[1];
assign Z[2] = B[1] ^ A[7] ^ A[6]; //exit

assign B[2] = X[2];
assign A[12] = bl[2] ^ M;
assign A[11] = al[2];
assign X[3] = A[13] | A[14] | A[15];
assign A[13] = A[11] & A[12];
assign A[14] = A[11] & B[2];
assign A[15] = A[12] & B[2];
assign Z[3] = B[2] ^ A[12] ^ A[11]; //exit

assign B[3] = X[3];
assign A[17] = bl[3] ^ M;
assign A[16] = al[3];
assign X[4] = A[18] | A[19] | A[20];
assign A[18] = A[16] & A[17];
assign A[19] = A[16] & B[3];
assign A[20] = A[17] & B[3];
assign Z[4] = B[3] ^ A[17] ^ A[16]; //exit

assign B[4] = X[4];
assign A[22] = bl[4] ^ M;
assign A[21] = al[4];
assign X[5] = A[23] | A[24] | A[25];
assign A[23] = A[21] & A[22];
assign A[24] = A[21] & B[4];
assign A[25] = A[22] & B[4];
assign Z[5] = B[4] ^ A[22] ^ A[21]; //exit
 
assign B[5] = X[5];
assign A[27] = bl[5] ^ M;
assign A[26] = al[5];
assign X[6] = A[28] | A[29] | A[30];
assign A[28] = A[26] & A[27];
assign A[29] = A[26] & B[5];
assign A[30] = A[27] & B[5];
assign Z[6] = B[5] ^ A[27] ^ A[26]; //exit

assign B[6] = X[6];
assign A[32] = bl[6] ^ M;
assign A[31] = al[6];
assign X[7] = A[33] | A[34] | A[35];
assign A[33] = A[31] & A[32];
assign A[34] = A[31] & B[6];
assign A[35] = A[32] & B[6];
assign Z[7] = B[6] ^ A[32] ^ A[31]; //exit

assign B[7] = X[7];
assign A[37] = bl[7] ^ M;
assign A[36] = al[7];
assign X[8] = A[38] | A[39] | A[40];
assign A[38] = A[36] & A[37];
assign A[39] = A[36] & B[7];
assign A[40] = A[37] & B[7];
assign Z[8] = B[7] ^ A[37] ^ A[36]; //exit

assign fff = M ^ (exx2 & mgg1) ^ (exx1 & mgg);
initial begin
    #1;
$display("help info");
 $display("vs = %d", vs);
$display("fff = %d", fff);
$display("k1 = %d", k1);
$display("k2 = %d", k2);
$display("left bigger = %d", exx2);
$display("right bigger = %d", exx1);
$display("Minus = %d", M);
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