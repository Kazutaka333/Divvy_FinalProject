// Create Date:    2019.2.18
// Latest rev:     2019.2.18
// Created by:     Group Divvy
// Design Name:    CSE141L
// Module Name:    LUT PC

module LUTPC (
  input [7:0] ReadData,
  output logic [15:0] PCAddr
);

logic[15:0] PCAddrLUT[2**8];

initial begin
// Read text file
$readmemb("sample_lut.txt",PCAddrLUT);
end

always_comb
begin
  PCAddr = PCAddrLUT[ReadData];
end

endmodule
