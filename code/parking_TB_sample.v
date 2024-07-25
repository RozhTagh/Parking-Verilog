module parking_TB ();

reg car_entered = 0;
reg is_uni_car_entered = 0;
reg car_exited = 0;
reg is_uni_car_exited = 0;
reg [5:0] current_hour;

wire [9:0] uni_parked_car;
wire [9:0] parked_car;
wire [9:0] uni_vacated_space;
wire [9:0] vacated_space;
wire uni_is_vacated_space;
wire is_vacated_space;

parking #(8, 3, 1) parking1 (car_entered, is_uni_car_entered, car_exited, is_uni_car_exited, current_hour, uni_parked_car, 
                  parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);

initial begin
    // write operations here
end

task uni_car_enter;
    begin
        $display("uni car enter:");
        car_entered = 1;
        is_uni_car_entered = 1;
        current_hour = ($time/60)%24;
        #10 $display("%02d:%02d -- uni parked_car: %d     parked_car: %d     uni vacated_space: %d     vacated space: %d     uni is vacated space: %d     is vacated space: %d\n", (($time-10)/60)%24, ($time-10)%60, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
        car_entered = 0;
        is_uni_car_entered = 0;
    end
endtask

task non_uni_car_enter;
    begin
        $display("non uni car enter:");
        car_entered = 1;
        is_uni_car_entered = 0;
        current_hour = ($time/60)%24;
        #10 $display("%02d:%02d -- uni parked_car: %d     parked_car: %d     uni vacated_space: %d     vacated space: %d     uni is vacated space: %d     is vacated space: %d\n", (($time-10)/60)%24, ($time-10)%60, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
        car_entered = 0;
    end
endtask

task uni_car_exit;
    begin
        $display("uni car exit:");
        car_exited = 1;
        is_uni_car_exited = 1;
        current_hour = ($time/60)%24;
        #10 $display("%02d:%02d -- uni parked_car: %d     parked_car: %d     uni vacated_space: %d     vacated space: %d     uni is vacated space: %d     is vacated space: %d\n", (($time-10)/60)%24, ($time-10)%60, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
        car_exited = 0;
        is_uni_car_exited = 0;
    end
endtask

task non_uni_car_exit;
    begin
        $display("non uni car exit:");
        car_exited = 1;
        is_uni_car_exited = 0;
        current_hour = ($time/60)%24;
        #10 $display("%02d:%02d -- uni parked_car: %d     parked_car: %d     uni vacated_space: %d     vacated space: %d     uni is vacated space: %d     is vacated space: %d\n", (($time-10)/60)%24, ($time-10)%60, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
        car_exited = 0;
    end
endtask

endmodule
