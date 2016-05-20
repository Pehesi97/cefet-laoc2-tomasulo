/*
	Instruction Set
		add: 000 -> add R0, R1, R2 -> R0 = R1 + R2
		sub: 001 -> sub R0, R1, R2 -> R0 = R1 - R2
		mul: 010 -> mul R0, R1, R2 -> R0 = R1 * R2
		div: 011 -> div R0, R1, R2 -> R0 = R1 / R2
		
	Instruction States
		2'b00 -> Issue
		2'b01 -> Execution
		2'b10 -> CDB
*/

module pratica3_pedroSilva_tulioMitre(clock);
	input clock;
	
	reg [3:0] queueAddress;
	wire [15:0] fetchingInstruction;
	
	initial begin
		queueAddress = 3'b0;
	end
	
	/*
		Instruction Fetch
	*/
	always @ (clock) begin
		case (fetchingInstruction[2:0])
			3'b000: 
				if(busy[0] == 1'b0) begin
					busy[0] = 1'b1;
					
				end
				else if(busy[1] == 1'b0) begin
					
				end
				else if(busy[2] == 1'b0) begin
					
				end
				else begin
				
				end
		endcase		
	end
	/*
		Reservation Stations
		
		0, 1, 2 -> Adders
		3, 4 -> Multipliers
		
		t = 0 -> V
		t = 1 -> Q
	*/
	reg [4:0] j [0:15], k [0:15], jt, kt, busy, op [0:2];
	
	romlpm fila(queueAddress, clock, fetchingInstruction);
	
endmodule
