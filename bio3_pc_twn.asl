state("bio3_pc")
{
         ushort hp : "bio3_pc.exe", 0x6FFC00;
	 uint save : "bio3_pc.exe", 0x6FF884;
	 uint total : "bio3_pc.exe", 0x704E98;
	 uint current : "bio3_pc.exe", 0x13706C, 0x5ac;
	 uint game_state : "bio3_pc.exe", 0x6FF7C0;
         ushort player_X : "bio3_pc.exe", 0x65BDC8;
         byte room_ID : "bio3_pc.exe", 0x704EE8;
         byte old_room : "bio3_pc.exe", 0x704EEC;
         byte cam_ID : "bio3_pc.exe", 0x704EEA;
         byte old_cam : "bio3_pc.exe", 0x704EEE;
         byte stage_ID : "bio3_pc.exe", 0x704EED;
	 byte old_stage : "bio3_pc.exe", 0x6E7F95;

	

          byte SLOT00 : "bio3_pc.exe", 0x7050A4;
	  byte SLOT01 : "bio3_pc.exe", 0x7050A8;
	  byte SLOT02 : "bio3_pc.exe", 0x7050AC;
	  byte SLOT03 : "bio3_pc.exe", 0x7050B0;
	  byte SLOT04 : "bio3_pc.exe", 0x7050B4;
	  byte SLOT05 : "bio3_pc.exe", 0x7050B8;
	  byte SLOT06 : "bio3_pc.exe", 0x7050BC;
	  byte SLOT07 : "bio3_pc.exe", 0x7050C0;
          byte SLOT08 : "bio3_pc.exe", 0x7050C4;
          byte SLOT09 : "bio3_pc.exe", 0x7050C8;


          byte PLD_ID : "bio3_pc.exe", 0x2FBDF9;
}

isLoading
{
    return true;
}


start
{
   if(current.room_ID == 13 && current.cam_ID == 11) {
	  return (current.game_state & 0x8000000) == 0x8000000;
   }
   return false;
   
}



gameTime
{
	
		return TimeSpan.FromSeconds((current.current - current.save + current.total) / 60.0);
	
}



reset
{
  return current.hp == 65516 || current.old_room == 0xFF || current.old_cam == 0xFF;
}


split
{
   const byte Magnum = 0x05;
   const byte Grenade_Launcher = 0x06;
   
   const byte Battery = 0x31;
   const byte Fire_Hook = 0x32;
   const byte Power_Cable = 0x33;
   const byte Fuse = 0x34;
   const byte Oil_Add = 0x36;
   const byte Machine_Oil = 0x39;
   const byte Mixed_Oil = 0x3A;
   const byte Wrench = 0x3C;
   const byte Fire_Hose = 0x3F;
   const byte Lighter_Oil = 0x41;
   const byte Green_Gem = 0x44;
   const byte Blue_Gem = 0x45;
   const byte Amber_Ball = 0x46;
   const byte Obsidian_Ball = 0x47;
   const byte Crystal_Ball =  0x48;
   const byte Gold_Gear = 0x4C;
   const byte Silver_Gear = 0x4D;
   const byte Chronos_Gear = 0x4E;
   const byte Bronze_Book = 0x4F;
   const byte Bronze_Compass = 0x50;
   const byte Vacc_Med = 0x51;
   const byte Vacc_Base = 0x52;
   const byte Vaccine = 0x55;
   const byte Med_Base = 0x58;
   const byte Water_Sample = 0x6F;
   const byte MO_Disk = 0x70;   
   const byte Lockpick = 0x72;
   const byte Warehouse_Key = 0x73;
   const byte Sickroom_Key = 0x74;
   const byte Stars_Key = 0x75;  
   const byte Chronos_Key = 0x79;
   const byte Facility_Key00 = 0x7E;
   const byte Facility_Key01 = 0x7F;
   const byte Boutique_Key = 0x80;
   const byte Chemical_Key = 0x60;

   var cur_seg = timer.CurrentSplit.Name;

if(cur_seg == "Basement")
{
   return current.room_ID == 6 && current.stage_ID == 1;
}
else if(cur_seg == "RPD Gates")
{
   return current.room_ID == 16 && current.stage_ID == 1;
}
else if(cur_seg == "Lockpick")
{
  return current.SLOT01 == Lockpick || current.SLOT02 == Lockpick || current.SLOT03 == Lockpick || current.SLOT04 == Lockpick; 
}
else if(cur_seg == "RPD Exit")
{
  return current.room_ID == 36 && current.stage_ID == 1 && current.old_room == 37; 
}
else if(cur_seg == "Firehook")
{

 return current.SLOT00 == Fire_Hook || current.SLOT01 == Fire_Hook || current.SLOT02 == Fire_Hook || current.SLOT03 == Fire_Hook || current.SLOT04 == Fire_Hook || current.SLOT05 == Fire_Hook || current.SLOT06 == Fire_Hook || current.SLOT07 == Fire_Hook;
}
else if(cur_seg == "Green Gem")
{
 return current.SLOT02 == Green_Gem || current.SLOT03 == Green_Gem || current.SLOT04 == Green_Gem || current.SLOT05 == Green_Gem || current.SLOT06 == Green_Gem || current.SLOT07 == Green_Gem;
}
else if(cur_seg == "Book")
{
 return current.SLOT02 == Bronze_Book || current.SLOT03 == Bronze_Book || current.SLOT04 == Bronze_Book || current.SLOT05 == Bronze_Book || current.SLOT06 == Bronze_Book || current.SLOT07 == Bronze_Book || current.SLOT08 == Bronze_Book || current.SLOT09 == Bronze_Book;
}
else if(cur_seg == "Battery")
{
 return current.SLOT02 == Battery || current.SLOT03 == Battery || current.SLOT04 == Battery || current.SLOT05 == Battery || current.SLOT06 == Battery || current.SLOT07 == Battery || current.SLOT08 == Battery || current.SLOT09 == Battery;
}
else if(cur_seg == "Pharmacy Escape")
{
 return current.room_ID == 11 && current.stage_ID == 1  && current.old_room == 27;
}
else if(cur_seg == "Train Crash")
{
  return current.room_ID == 5 && current.stage_ID == 2 && current.old_room == 21 && current.old_stage == 0;
}
else if(cur_seg == "Chronos Key")
{
 return current.SLOT02 == Chronos_Key || current.SLOT03 == Chronos_Key || current.SLOT04 == Chronos_Key || current.SLOT05 == Chronos_Key || current.SLOT06 == Chronos_Key || current.SLOT07 == Chronos_Key || current.SLOT08 == Chronos_Key || current.SLOT09 == Chronos_Key; 
}
else if(cur_seg == "Carlos")
{
  return current.PLD_ID == 2;
}
else if(cur_seg == "Save Jill")
{
 return current.PLD_ID == 1;
}
else if(cur_seg == "Worm Kill")
{
 return current.room_ID == 16 && current.stage_ID == 4 && current.old_room == 21;
}
else if(cur_seg == "Water Puzzle")
{
 return current.room_ID == 5 && current.stage_ID == 5 && current.old_room == 6;
}
else if(cur_seg == "Chemical Keycard")
{
 return current.SLOT00 == Chemical_Key || current.SLOT01 == Chemical_Key || current.SLOT02 == Chemical_Key || current.SLOT03 == Chemical_Key || current.SLOT04 == Chemical_Key || current.SLOT05 == Chemical_Key || current.SLOT06 == Chemical_Key || current.SLOT07 == Chemical_Key || current.SLOT08 == Chemical_Key || current.SLOT09 == Chemical_Key;
}

else if(cur_seg == "End")
{
 return current.room_ID == 14 && current.stage_ID == 5 && current.old_room == 15 && current.cam_ID == 2 && current.player_X == 48664;
}


}
