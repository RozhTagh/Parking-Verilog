module parking #(
    parameter more_space = 500,
    parameter less_space = 200,
    parameter step = 50
)(
    car_entered, is_uni_car_entered,
    car_exited, is_uni_car_exited, current_hour,
    uni_parked_car, parked_car, 
    uni_vacated_space, vacated_space,
    uni_is_vacated_space, is_vacated_space
);

input car_entered, is_uni_car_entered, car_exited, is_uni_car_exited;
input [5:0] current_hour;

output reg [9:0] uni_parked_car = 0;
output reg [9:0] parked_car = 0;
output reg [9:0] uni_vacated_space = more_space;
output reg [9:0] vacated_space = less_space;
output reg uni_is_vacated_space = 1, is_vacated_space = 1;

reg [9:0] uni_total_space;
reg [9:0] non_uni_total_space;

always @(posedge car_entered or posedge car_exited) begin
    if(current_hour >= 8 & current_hour < 13) begin
        uni_total_space = more_space;
        non_uni_total_space = less_space;
    end

    else if(current_hour >= 13 & current_hour < 16) begin
        uni_total_space = more_space - (current_hour - 12) * step;
        non_uni_total_space = less_space + (current_hour - 12) * step;

        if(uni_parked_car > uni_total_space) begin
            parked_car = parked_car + (uni_parked_car - uni_total_space);
            vacated_space = non_uni_total_space - parked_car;
            uni_parked_car = uni_total_space;
            uni_vacated_space = 0;
        end
    end

    else if(current_hour >= 16) begin
        uni_total_space = less_space;
        non_uni_total_space = more_space;

        if(uni_parked_car > uni_total_space) begin
            parked_car = parked_car + (uni_parked_car - uni_total_space);
            vacated_space = non_uni_total_space - parked_car;
            uni_parked_car = uni_total_space;
            uni_vacated_space = 0;
        end
    end

    if(uni_parked_car == uni_total_space) 
        uni_is_vacated_space = 0;
    if(parked_car == non_uni_total_space)
        is_vacated_space = 0;

    if(car_entered) begin
        if(is_uni_car_entered & current_hour >= 8) begin
            if(uni_is_vacated_space) begin
                uni_parked_car = uni_parked_car + 1;
                uni_vacated_space = uni_vacated_space - 1;
            end

            else if(is_vacated_space) begin
                parked_car = parked_car + 1;
                vacated_space = vacated_space - 1;
            end
        end

        else if(!is_uni_car_entered & current_hour >= 8) begin
            if(is_vacated_space) begin
                parked_car = parked_car + 1;
                vacated_space = vacated_space - 1;
            end
        end

        if(uni_parked_car == uni_total_space) 
            uni_is_vacated_space = 0;
        if(parked_car == non_uni_total_space)
            is_vacated_space = 0;
    end

    if (car_exited & current_hour >= 8) begin
        if (is_uni_car_exited & (uni_parked_car > 0)) begin
            uni_parked_car = uni_parked_car - 1;
            uni_vacated_space = uni_vacated_space + 1;
            uni_is_vacated_space = 1;
        end

        else if (!is_uni_car_exited & (parked_car > 0)) begin
            parked_car = parked_car - 1;
            vacated_space = vacated_space + 1;
            is_vacated_space = 1;
        end
    end
end

endmodule