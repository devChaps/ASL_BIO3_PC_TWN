/ Biohazard Outbreak (JPN) "Outbreak" Auto Splitter
// Dchaps 12/18/2015

state("pcsx2-r5875")
{
		
         ushort start_flag   : "pcsx2-r5875.exe", 0x1F7DEF6C;
	     byte input_trigger : "pcsx2-r5875.exe", 0x1F7B767C;
	     byte t_cam         : "pcsx2-r5875.exe", 0x1F7DEF51;
         byte c_cam        : "pcsx2-r5875.exe", 0x1F7DEF53;

       
}




isLoading
{
    return true;
}

init
{

vars.offs = 0x2048BF92 - int.Parse(modules.First().BaseAddress.ToString());
vars.offm = 0x2048BF91 - int.Parse(modules.First().BaseAddress.ToString());
vars.offt_cam = 0x203AEF51 - int.Parse(modules.First().BaseAddress.ToString()); 
vars.offc_cam = 0x203AEF53 - int.Parse(modules.First().BaseAddress.ToString());
vars.off_trig = 0x2038767C - int.Parse(modules.First().BaseAddress.ToString());
vars.off_start = 0x203AEF6C - int.Parse(modules.First().BaseAddress.ToString());
vars.end_flag = 0x203876E0 - int.Parse(modules.First().BaseAddress.ToString());

}


start
{

return vars.start_flag == 0x7FFF;  



}

reset
{
 
}

split
{

   var cur_segname = timer.CurrentSplit.Name;
   


if(cur_segname == "Forklift hype")
{	
  return vars.tcam == 0x0E && vars.input_trigger == 0x01;
}
else if(cur_segname == "Roof")
{
  return vars.tcam == 0x0E && vars.ccam == 0x02;
}
else if(cur_segname == "Car RNG")
{
  return vars.tcam == 0x06 && vars.ccam == 0x01 && vars.start_flag == 0;
}
else if(cur_segname == "Titanium Gate")
{
 return vars.start_flag == 0x76F7;
}
else if(cur_segname == "Bridge")
{
 return vars.tcam == 0x05 && vars.ccam == 0x01 && vars.start_flag == 0xFFFF;
}
else if(cur_segname == "End")
{
 return vars.eflag == 00 && vars.ccam == 0x02;
}
    
    
}


gameTime
{   
    return TimeSpan.FromSeconds(vars.min * 60 + (vars.sec));
}

update
{

   
  vars.sec = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.offs);
  vars.min = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.offm);
  vars.tcam = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.offt_cam);
  vars.ccam = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.offc_cam);
  vars.start_flag = memory.ReadValue<ushort>(modules.First().BaseAddress + (int)vars.off_start);
  vars.input_trigger = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.off_trig);
  vars.eflag = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.end_flag);
 
}
