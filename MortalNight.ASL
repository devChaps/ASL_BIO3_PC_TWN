state("Episode 1.exe", "v1.0")
{
	uint time : "Episode 1.exe", 0x292FAC;
 
}


state("Episode 2", "v1.1")
{
	uint time : "Episode 2.exe", 0x292FAC;
 
}

state("Episode 3", "v1.2")
{
	uint time : "Episode 3.exe", 0x292FAC;
 
}




init
{
 
if(modules.First().ModuleName == "Episode 1.exe")
version = "v1.0";
else if(modules.First().ModuleName == "Episode 2.exe")
version = "v1.1";
else if(modules.First().ModuleName == "Episode 3.exe")
version = "v1.2";


}


isLoading
{
    return true;
}


start
{
  
}

reset
{
 
}



gameTime
{
    return TimeSpan.FromSeconds(current.time);
}
