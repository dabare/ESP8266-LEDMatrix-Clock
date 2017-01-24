require("ds3231")

wifi.setmode(wifi.NULLMODE)

MAX7219_REG_NOOP        = 0x00
MAX7219_REG_DECODEMODE  = 0x09
MAX7219_REG_INTENSITY   = 0x0A
MAX7219_REG_SCANLIMIT   = 0x0B
MAX7219_REG_SHUTDOWN    = 0x0C
MAX7219_REG_DISPLAYTEST = 0x0F


faces = {
  { 0x7F, 0x7F, 0x0E, 0x1C, 0x0E, 0x7F, 0x7F, 0x00} , 
 { 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, -- 'k'
};

function sendByte(reg, data)
  spi.send(1,reg * 256 + data)
  tmr.delay(50)
end

function setup()
    spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 16, 8)

    sendByte (MAX7219_REG_SHUTDOWN, 1)
    sendByte (MAX7219_REG_SCANLIMIT, 7)
    sendByte (MAX7219_REG_DECODEMODE, 0x00)
    sendByte (MAX7219_REG_DISPLAYTEST, 0)
    sendByte (MAX7219_REG_INTENSITY, 0)
    sendByte (MAX7219_REG_SHUTDOWN, 1)
    
    tmr.stop(0)
end


setup()
ds3231.init(3, 4);

disp={
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0}
}

font={
{
{0,1,1,0},
{0,0,1,0},
{0,0,1,0},
{0,1,1,1}},

{
{1,1,1,1},
{0,0,1,1},
{1,1,0,0},
{1,1,1,1}},

{
{1,1,1,1},
{0,0,1,1},
{0,0,0,1},
{1,1,1,1}},

{
{1,0,0,0},
{1,0,1,0},
{1,1,1,1},
{0,0,1,0}},

{
{1,1,1,1},
{1,1,0,0},
{0,0,1,1},
{1,1,1,1}},

{
{1,1,1,1},
{1,0,0,0},
{1,1,1,1},
{1,1,1,1}},

{
{0,1,1,1},
{0,0,0,1},
{0,0,1,0},
{0,0,1,0}},

{
{1,1,1,1},
{0,1,1,0},
{1,0,0,1},
{1,1,1,1}},

{
{1,1,1,1},
{1,1,1,1},
{0,0,0,1},
{1,1,1,1}},

{
{0,1,1,0},
{1,0,0,1},
{1,0,0,1},
{0,1,1,0}},

{
{1,0,0,1},
{1,0,0,1},
{1,0,0,1},
{1,0,0,1}},

{
{1,0,1,1},
{1,0,1,1},
{1,0,1,1},
{1,0,1,1}}
}

function draw(matrix)
    for i=1,8 do
        sendByte(i, matrix[1][i] + matrix[2][i]*2 + matrix[3][i]*4 + matrix[4][i]*8 + matrix[5][i]*16 + matrix[6][i]*32 + matrix[7][i]*64 + matrix[8][i]*128)
    end
end

function drawMins(min)
    if(min>=1) then
        disp[1][5] = 1
    else
        disp[1][5] = 0
    end

    if(min>=2) then
        disp[1][6] = 1
    else
        disp[1][6] = 0
    end

    if(min>=3) then
        disp[1][7] = 1
    else
        disp[1][7] = 0
    end

    if(min>=4) then
        disp[1][8] = 1
    else
        disp[1][8] = 0
    end

    if(min>=5) then
        disp[2][8] = 1
    else
        disp[2][8] = 0
    end

    if(min>=6) then
        disp[3][8] = 1
    else
        disp[3][8] = 0
    end

    if(min>=7) then
        disp[4][8] = 1
    else
        disp[4][8] = 0
    end

    if(min>=8) then
        disp[5][8] = 1
    else
        disp[5][8] = 0
    end

    if(min>=9) then
        disp[6][8] = 1
    else
        disp[6][8] = 0
    end

    if(min>=10) then
        disp[7][8] = 1
    else
        disp[7][8] = 0
    end

    if(min>=11) then
        disp[8][8] = 1
    else
        disp[8][8] = 0
    end

    if(min>=12) then
        disp[8][7] = 1
    else
        disp[8][7] = 0
    end

    if(min>=13) then
        disp[8][6] = 1
    else
        disp[8][6] = 0
    end

    if(min>=14) then
        disp[8][5] = 1
    else
        disp[8][5] = 0
    end

    if(min>=15) then
        disp[8][4] = 1
    else
        disp[8][4] = 0
    end

    if(min>=16) then
        disp[8][3] = 1
    else
        disp[8][3] = 0
    end

    if(min>=17) then
        disp[8][2] = 1
    else
        disp[8][2] = 0
    end

    if(min>=18) then
        disp[8][1] = 1
    else
        disp[8][1] = 0
    end

    if(min>=19) then
        disp[7][1] = 1
    else
        disp[7][1] = 0
    end

    if(min>=20) then
        disp[6][1] = 1
    else
        disp[6][1] = 0
    end

    if(min>=21) then
        disp[5][1] = 1
    else
        disp[5][1] = 0
    end

    if(min>=22) then
        disp[4][1] = 1
    else
        disp[4][1] = 0
    end

    if(min>=23) then
        disp[3][1] = 1
    else
        disp[3][1] = 0
    end

    if(min>=24) then
        disp[2][1] = 1
    else
        disp[2][1] = 0
    end

    if(min>=25) then
        disp[1][1] = 1
    else
        disp[1][1] = 0
    end

    if(min>=26) then
        disp[1][2] = 1
    else
        disp[1][2] = 0
    end

    if(min>=27) then
        disp[1][3] = 1
    else
        disp[1][3] = 0
    end

    if(min>=28) then
        disp[1][4] = 1
    else
        disp[1][4] = 0
    end
    
    draw(disp)
end

function drawHour(hour)
    for i=1,4 do
        for j=1,4 do
            disp[i+2][j+2] = font[hour][i][j]
        end
    end
end



m=0;
timerId = 0
timerDelay = 1000 -- 5sec
tmr.alarm(timerId, timerDelay, 1, function()

local second, minute, hour, day, date, month, year = ds3231.getTime();
 
h = (hour%12);
if(h == 0) then
drawHour(12);
else
drawHour(h);
end

m = (minute*28)/60 +1;
end)
    

k=0;
tmr.alarm(1, 1000, 1, function()
k=(k+1)%2
    if(k==0) then
drawMins(m);
else 
    drawMins(m-1);
    end
end)


srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
            local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");


        if(vars ~= nil) then
        local i , j =string.find(vars, ":");

            if((i ~= nil) and (j~=nil))then

                h = tonumber(string.sub(vars, 1, i-1));
                m = tonumber(string.sub(vars, j+1, j+2));
                print(h)
                print(m)
                ds3231.setTime(0, m, h, 7, 13, 9, 16);
            end 
        end
       
       
        buf = buf.."<h1> MAdhava</h1>";
        buf = buf.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";



        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)


