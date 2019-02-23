state("ePSXe" "v2.0")
{
		
         uint IGT: "ePSXe.exe", 0x8D6CA4;
       
}

state("emuhawk", "v3.0")
{
    uint GameTimer: "octoshock.dll", 0x3A562C;
}


isLoading
{
    return true;
}

init
{

if(modules.First().ModuleName == "ePSXe.exe")
version = "v2.0";
else if(modules.First().ModuleName == "emuhawk.exe")
version = "v3.0";



}


start
{



}

reset
{
 
}

split
{

    
    
}


gameTime
{   
    return TimeSpan.FromSeconds(current.IGT/4096f);
}

update
{

   
 
}
