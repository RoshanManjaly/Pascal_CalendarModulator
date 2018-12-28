{*
Roshan Manjaly
A program in Pascal that works with dates
Principles of Programming
*}

program dt;
uses sysutils;

type
    month_range = integer;
    day_range = integer;
    date_t = record
        day : day_range;
        month : month_range;
        year : integer;
    end;

var
    d1,d2,d3 : date_t;
    DD, MM, YY : word;
    m : string;
    output : string;

procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
    begin
        dt.day := day;
        dt.month := month;
        dt.year := year;
    end;


procedure init_date1 (var dt : date_t);
    begin
        DeCodeDate (Date, YY, MM, DD);
        dt.day := DD;
        dt.month := MM;
        dt.year := YY;
    end;

function date_equal (date1 : date_t; date2 : date_t) : boolean;
    begin
        if ((date1.day = date2.day) and (date1.month = date2.month) and (date1.year = date2.year)) then
            exit(true);
    end;


function date_less_than (date1 : date_t; date2 : date_t) : boolean;
    begin
        if (date1.year < date2.year) then
            exit(true);
        if ((date1.year = date2.year) and (date1.month < date2.month)) then
            exit(true);
        if ((date1.year = date2.year) and (date1.month = date2.month) and (date1.day < date2.day)) then
            exit(true);
    end;

function month_str(month : month_range) : string;
    begin
        if (month = 1) then
            m := ('January');
        if (month = 2) then
            m := ('February');
        if (month = 3) then
            m := ('March');
        if (month = 4) then
            m := ('April');
        if (month = 5) then
            m := ('May');
        if (month = 6) then
            m := ('June');
        if (month = 7) then
            m := ('July');
        if (month = 8) then
            m := ('August');
        if (month = 9) then
            m := ('September');
        if (month = 10) then
            m := ('October');
        if (month = 11) then
            m := ('November');
        if (month = 12) then
            m := ('December');
        exit(m)
    end;

procedure format_date (date : date_t; var ret_str : string);
    begin
        output := concat(month_str(date.month), ' ', inttostr(date.day), ', ', inttostr(date.year));
    end;

procedure next_day (var date : date_t);
    function month_length (month: month_range; leap: boolean): day_range;
        begin

            if (month = 1) then
                exit(31);
            if (month = 2) then
                if (leap = false) then
                    exit(28)
                else if (leap = true) then
                    exit(29);
            if (month = 3) then
                exit(31);
            if (month = 4) then
                exit(30);
            if (month = 5) then
                exit(31);
            if (month = 6) then
                exit(30);
            if (month = 7) then
                exit(31);
            if (month = 8) then
                exit(30);
            if (month = 9) then
                exit(30);
            if (month = 10) then
                exit(31);
            if (month = 11) then
                exit(30);
            if (month = 12) then
                exit(31);
        end;

    function leap_year (year : integer) : boolean;
        begin
            if (date.year mod 400 = 0) then
                exit(true);
            if ((date.year mod 4 = 0) and (date.year mod 100 <> 0)) then
                exit(true);
         end;

    begin
        if((date.month = 12) and (date.day = month_length(date.month, leap_year(date.year)))) then begin
            date.year := date.year + 1;
            date.month := 1;
            date.day := 0;
            end;
        if (date.day = month_length(date.month, leap_year(date.year))) then begin
            date.month := date.month + 1;
            date.day := 0;
            end;
        date.day := date.day + 1;
    end;







begin

    init_date(d1, 5, 3, 2018); // part 1
    init_date(d2, 31, 12, 1999);
    init_date(d3, 1, 1, 2000);

    format_date(d1, output); // d1
    writeln('d1: ', output);
    format_date(d2, output); // d2
    writeln('d2: ', output);
    format_date(d3, output); // d3
    writeln('d3: ', output);
    writeln();


    writeln('d1 < d2: ', date_less_than(d1, d2));// part 2
    writeln('d2 < d3? ', date_less_than(d2, d3));
    writeln();


    next_day(d2); // part 3
        format_date(d2, output);
        writeln('next day d2: ', output);
        writeln('d2 = d3? ',date_equal(d2, d3));
        writeln();


    next_day(d2); // part 4
        format_date(d2, output);
        writeln('next day d2: ', output);
        writeln('d2 < d3: ', date_less_than(d2, d3));
        writeln('d2 = d3? ', date_equal(d2, d3));
        writeln('d2 > d3? ', date_less_than(d3, d2));


    init_date(d1, 28, 2, 1529); // part 5
        init_date(d1, 28, 2, 1529); // part 5 sub a
        format_date(d1, output);
        writeln('initialized d1 to ', output);
        next_day(d1);
        format_date(d1, output);
        writeln('next day d1: ', output);
        writeln();

        init_date(d1, 28, 2, 1460); // part 5 sub b
        format_date(d1, output);
        writeln('initialized d1 to ', output);
        next_day(d1);
        format_date(d1, output);
        writeln('next day d1: ', output);
        writeln();

        init_date(d1, 28, 2, 1700); // part 5 sub c
        format_date(d1, output);
        writeln('initialized d1 to ', output);
        next_day(d1);
        format_date(d1, output);
        writeln('next day d1: ', output);
        writeln();

        init_date(d1, 28, 2, 1600); // part 5 sub d
        format_date(d1, output);
        writeln('initialized d1 to ', output);
        next_day(d1);
        format_date(d1, output);
        writeln('next day d1: ', output);

end.