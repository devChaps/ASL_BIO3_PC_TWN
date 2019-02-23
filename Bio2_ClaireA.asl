//Biohazard 2 Sourcenext Auto Splitter, (Claire A)
// Dchaps 2015

state("bio2")
{
	uint time : "bio2.exe", 0x280538;
        uint hp  : "bio2.exe", 0x589FE6;
	ushort pos_z : "bio2.exe",0x589ED0;
        byte room_ID : "bio2.exe", 0x58EAB6;
        byte old_room : "bio2.exe", 0x58EABA;
        byte stage_ID : "bio2.exe", 0x58EAB4;
        byte PLD_ID : "bio2.exe", 0x58EAC4;
        byte cam_ID : "bio2.exe", 0x58EAB8;  

        byte SLOT00 : "bio2.exe", 0x58ECD4;
        byte SLOT01 : "bio2.exe", 0x58ECD8;
        byte SLOT02 : "bio2.exe", 0x58ECDC;
        byte SLOT03 : "bio2.exe", 0x58ECE0;
        byte SLOT04 : "bio2.exe", 0x58ECE4;
        byte SLOT05 : "bio2.exe", 0x58ECE8;
        byte SLOT06 : "bio2.exe", 0x58ECEC;
        byte SLOT07 : "bio2.exe", 0x58ECF0;     
}


isLoading
{
    return true;
}


start
{
  return current.hp == 0xC8;
}

reset
{
 return current.old_room == 0xFF;
}

split
{

const byte Valve = 0x32;
const byte Red_Jewl00 = 0x33;
const byte Red_Jewl01 = 0x34;
const byte Blue_Card = 0x35;
const byte Serpent_Stone = 0x36;
const byte Jaguar_StoneL = 0x38;
const byte Jaguar_StoneR = 0x39;
const byte Eagle_Stone = 0x3A;
const byte Bishop_Plug = 0x3B;
const byte Rook_Plug = 0x3C;
const byte Knight_Plug = 0x3D;
const byte King_Plug = 0x3E;
const byte Unicorn_Medal = 0x47;
const byte Eagle_Medal = 0x48;
const byte Wolf_Medal = 0x49;
const byte Cog_Wheel = 0x4A;
const byte Manhole_Opener = 0x4B;
const byte Main_Fuse = 0x4C;
const byte MO_DISK = 0x60;
const byte Spade_Key = 0x59;
const byte Diamond_Key = 0x5A;
const byte Heart_Key = 0x5B;
const byte Club_Key = 0x5C;
const byte Panel_Key = 0x5D;


   var cur_segname = timer.CurrentSplit.Name;
   //var cur_idx = timer.CurrentSplitIndex.Name;
   



if(cur_segname == "RPD")
{
    return current.room_ID == 0 && current.stage_ID == 1;
}
else if(cur_segname == "Stars Office")
{     
   return current.room_ID == 20 && current.stage_ID == 00 && current.old_room == 21;
}

else if(cur_segname == "Library")
{
    return current.room_ID == 16 && current.stage_ID == 0 && current.old_room == 18; 
}

else if(cur_segname == "Chief Irons")
{
  return current.room_ID == 27 && current.stage_ID == 1 && current.cam_ID == 2;
}
else if(cur_segname == "Club Key")
{
    return current.room_ID == 5 && current.stage_ID == 2 && current.old_room == 6;
}
else if(cur_segname == "Red Hallway")
{
   return current.room_ID == 10 && current.stage_ID == 1 && current.old_room == 12;
}
else if(cur_segname == "G-Mutant")
{
  return current.room_ID == 0 && current.stage_ID == 2 && current.old_room == 9; 
}
else if(cur_segname == "Sewers")
{
  return current.room_ID == 13 && current.stage_ID == 3 && current.old_room == 7;
}
else if(cur_segname == "Train Birkin")
{
   return current.room_ID == 5 && current.stage_ID == 4 && current.old_room == 9;
}
else if(cur_segname == "MO Disk")
{
       
  return current.room_ID == 12 && current.stage_ID == 5 && current.old_room == 16;  
}
else if(cur_segname == "End")
{
  return current.room_ID == 0 && current.stage_ID == 6 && current.cam_ID == 8 && current.pos_z == 0xFE1A;
}

    
}


gameTime
{
    return TimeSpan.FromSeconds(current.time);
}
