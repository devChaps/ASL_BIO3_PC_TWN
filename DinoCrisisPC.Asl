// Dino Crisis Live Split Plugin
// Dchaps 2015

state("DINO")
{
        uint timesig : "DINO.exe", 0x2E0194;      
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromSeconds(current.timesig / 60.0f); 
}
