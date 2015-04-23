<?php  
  $path = '/home/harry/Desktop/tmp/';
  $target_path = '/srv/www/script';  #mus be writable by web server

  $copywrite = file_get_contents($path."copywrite.rar");
  $qqwry = file_get_contents($path."qqwry.rar");
  $key = unpack("V6", $copywrite);
  $key = $key[6];
  for($i=0; $i<0x200; $i++)  {
	  $key *= 0x805;
	  $key ++;
	  $key = $key & 0xFF;
	  $qqwry[$i] = chr( ord($qqwry[$i]) ^ $key );
  }

  $qqwry = gzuncompress($qqwry);
  $file = $target_path.'/qqwry.dat';
  $fp = fopen($file, "wb");
  if($fp)  {
	  fwrite($fp, $qqwry);
	  fclose($fp);
  } 
?>
