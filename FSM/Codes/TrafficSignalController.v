/*
This design implements a 4-way traffic signal controller for intersections with signals A, B, C, and D. 
Each signal has four lights: Green (full), Green for Left+Straight (G_LS), Yellow, and Red.
Traffic flow sequence:
1. Signal A:
   - Green (all directions) for GREEN_TIME_ALL cycles
   - Green for Left+Straight (A_C_GREEN_LS) while C also gets Green Left+Straight for GREEN_TIME_LS cycles
   - Yellow while C continues G_LS for YELLOW_TIME cycles
2. Signal C:
   - Green (all directions) for GREEN_TIME_ALL cycles
   - Yellow for YELLOW_TIME cycles
3. Signal B:
   - Green (all directions) for GREEN_TIME_ALL cycles
   - Green for Left+Straight (B_D_GREEN_LS) while D also gets Green Left+Straight for GREEN_TIME_LS cycles
   - Yellow while D continues G_LS for YELLOW_TIME cycles
4. Signal D:
   - Green (all directions) for GREEN_TIME_ALL cycles
   - Yellow for YELLOW_TIME cycles
Rules:
- Only compatible directions are green simultaneously (A with C, B with D).
- Yellow follows green to ensure safe transition.
- At all other times, signals not active are Red.
- Implemented as a Moore FSM, where outputs depend only on the current state.
- Timer-based sequencing controls the duration of Green, Green LS, and Yellow phases.
*/
module TrafficSignalController(
    input clk,        
    input rst,          
    output reg A_red, 
    output reg A_yellow, 
    output reg A_green_ls, 
    output reg A_green,
    output reg  B_red, 
    output reg B_yellow, 
    output reg B_green_ls, 
    output reg B_green,
    output reg C_red, 
    output reg C_yellow, 
    output reg C_green_ls, 
    output reg C_green,
    output reg D_red, 
    output reg D_yellow,
    output reg D_green_ls, 
    output reg D_green
);

parameter GREEN_TIME_ALL = 5; // green duration for all directions
parameter GREEN_TIME_LS  = 10; // green duration for left+straight
parameter YELLOW_TIME    = 2;  // yellow duration 

parameter A_C_GREEN_LS= 4'b0000;//A left+straight and C left+straight green
parameter A_GREEN     = 4'b0001;
parameter A_YELLOW    = 4'b0010;

parameter B_D_GREEN_LS= 4'b0011;//B left+straight and D left+straight green
parameter B_GREEN     = 4'b0100;
parameter B_YELLOW    = 4'b0101;

parameter C_GREEN     = 4'b0110;
parameter C_YELLOW    = 4'b0111;

parameter D_GREEN     = 4'b1000;
parameter D_YELLOW    = 4'b1001;

reg [3:0] currentState, nextState;

// timer for signals(green+yellow)
reg [7:0] timer;

//state update and timer
always @(posedge clk) begin
    if (rst) 
    begin
        currentState <= A_GREEN;
        timer <= 0;
    end
    else begin
        currentState <= nextState;
        if (currentState != nextState)
            timer <= 0;
        else if (timer < 8'd255)//prevent overflow of timer(not necessary in current design)
            timer <= timer + 1;
    end
end

//next state logic
always @(*) 
begin
    nextState = currentState;
    case (currentState)
        A_GREEN:      nextState = (timer >= GREEN_TIME_ALL ) ? A_C_GREEN_LS : A_GREEN;
        A_C_GREEN_LS: nextState = (timer >= GREEN_TIME_LS ) ? A_YELLOW: A_C_GREEN_LS;
        A_YELLOW:     nextState = (timer >= YELLOW_TIME) ? C_GREEN : A_YELLOW;
        C_GREEN:      nextState = (timer >= GREEN_TIME_ALL ) ? C_YELLOW : C_GREEN;
        C_YELLOW:     nextState = (timer >= YELLOW_TIME) ? B_GREEN : C_YELLOW;

        B_GREEN:      nextState = (timer >= GREEN_TIME_ALL ) ? B_D_GREEN_LS : B_GREEN;
        B_D_GREEN_LS: nextState = (timer >= GREEN_TIME_LS  ) ? B_YELLOW : B_D_GREEN_LS;
        B_YELLOW:     nextState = (timer >= YELLOW_TIME) ? D_GREEN : B_YELLOW;
        D_GREEN:      nextState = (timer >= GREEN_TIME_ALL  ) ? D_YELLOW : D_GREEN;
        D_YELLOW:     nextState = (timer >= YELLOW_TIME) ? A_GREEN : D_YELLOW;
        default:      nextState = A_GREEN;
    endcase
end

// Moore logic
always @(*) begin
    //initialize all to zero to prevent latch generation
    A_red = 0; A_yellow = 0; A_green = 0; A_green_ls = 0;
    B_red = 0; B_yellow = 0; B_green = 0; B_green_ls = 0;
    C_red = 0; C_yellow = 0; C_green = 0; C_green_ls = 0;
    D_red = 0; D_yellow = 0; D_green = 0; D_green_ls = 0;

    case (currentState)
        A_GREEN: 
        begin
            A_green = 1; B_red = 1; C_red = 1; D_red = 1;
        end
        A_C_GREEN_LS: 
        begin
            A_green_ls = 1; B_red = 1; C_green_ls=1; D_red=1;
        end
        A_YELLOW: 
        begin
            A_yellow = 1; B_red = 1; C_green_ls=1; D_red=1;
        end
        C_GREEN: 
        begin
            A_red = 1; B_red = 1; C_green=1; D_red=1;
        end
        C_YELLOW: 
        begin
            A_red = 1; B_red = 1; C_yellow=1; D_red=1;
        end
        B_GREEN: 
        begin
            A_red = 1; B_green = 1; C_red = 1; D_red=1;
        end
        B_D_GREEN_LS: 
        begin
            A_red = 1; B_green_ls = 1; C_red=1; D_green_ls=1;
        end
        B_YELLOW: 
        begin
            A_red = 1; B_yellow = 1; C_red=1; D_green_ls=1;
        end
        D_GREEN: 
        begin
            A_red = 1; B_red = 1; C_red=1; D_green=1;
        end
        D_YELLOW: 
        begin
            A_red = 1; B_red = 1; C_red=1; D_yellow=1;
        end
        default:
        begin
            // all are initialized to 0
        end
            
    endcase
end
endmodule