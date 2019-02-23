// Outbreak File 2 Underbelly Auto Splitter
// Dchaps 1/4/2016

state("pcsx2-r5875")
{

       
       
}




isLoading
{
    return true;
}

init
{

vars.baseoff = int.Parse(modules.First().BaseAddress.ToString());

vars.minoff = 0x204912D1 - vars.baseoff;
vars.secoff = 0x2024AF38 - vars.baseoff;
vars.RID_off = 0x203137BC - vars.baseoff;
vars.CID_off = 0x203B31D3 - vars.baseoff;
vars.SCE_off = 0x203137BA - vars.baseoff;
vars.slot00_off = 0x2047C9C4 - vars.baseoff;
vars.slot01_off = 0x2047C9C5 - vars.baseoff;
vars.slot02_off = 0x2047C9C6 - vars.baseoff;
vars.slot03_off = 0x2047C9C7 - vars.baseoff;
vars.menu_off = 0x16793B6E - vars.baseoff;
vars.result_off = 0x2038ADD4 - vars.baseoff;
vars.ui_off = 0x20388E0C - vars.baseoff;
vars.mega_off = 0x2076100C - vars.baseoff;
vars.eflag_off = 0x16793B6E - vars.baseoff;

}


start
{
  return vars.SCE_ID != 0xFF && vars.RID > 0;
}

reset
{
 return vars.SCE_ID == 0xFF && vars.result >= 0;
}

split
{

   var cur_segname = timer.CurrentSplit.Name;
   
if(cur_segname == "Employee Passage")
{	
  return vars.RID == 0x07 && vars.SCE_ID == 0x0A;
}
else if(cur_segname == "B2F Key")
{
  return vars.slot00 == 0x4E || vars.slot01 == 0x4E || vars.slot02 == 0x4E || vars.slot03 == 0x4E; 
}
else if(cur_segname == "Pipe Fix")
{
  return vars.RID == 0x18 && vars.CID == 0x05;
}
else if(cur_segname == "Blue Emblem")
{
  return vars.slot00 == 0x89 || vars.slot01 == 0x89 || vars.slot02 == 0x89 || vars.slot03 == 0x89;
}
else if(cur_segname == "Mega Kill")
{
  return vars.megahp == 0xFFFF; 
}
else if(cur_segname == "Train")
{
 return vars.slot00 == 0x00 && vars.slot01 == 0x00 && vars.slot02 == 0x00 && vars.slot03 == 0x00;
}
    
    
}


gameTime
{   
    return TimeSpan.FromSeconds(vars.min * 60 + (vars.sec));
}

update
{

  vars.sec = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.secoff);
  vars.min = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.minoff);
  vars.RID = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.RID_off);
  vars.CID = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.CID_off);
  vars.SCE_ID = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.SCE_off);
  vars.slot00 = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.slot00_off);
  vars.slot01 = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.slot01_off);
  vars.slot02 = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.slot02_off);
  vars.slot03 = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.slot03_off);
  vars.result = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.result_off);
  vars.menu = memory.ReadValue<byte>(modules.First().BaseAddress + (int)vars.menu_off);
  vars.ui = memory.ReadValue<int>(modules.First().BaseAddress + (int)vars.ui_off);
  vars.megahp = memory.ReadValue<ushort>(modules.First().BaseAddress + (int)vars.mega_off);
  vars.eflag = memory.ReadValue<ushort>(modules.First().BaseAddress + (int)vars.eflag_off);

  
}

