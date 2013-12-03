package
{
	import flash.filters.ColorMatrixFilter;
	
	public class ColorMatrix
	{
		//Adapted from both Quasimondo and gskinner's colormatrix classes.
		
		
		public var matrixArray:Array;
		private static var identityArray:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
		private static var DELTA_INDEX:Array = [
			0,    0.01, 0.02, 0.04, 0.05, 0.06, 0.07, 0.08, 0.1,  0.11,
			0.12, 0.14, 0.15, 0.16, 0.17, 0.18, 0.20, 0.21, 0.22, 0.24,
			0.25, 0.27, 0.28, 0.30, 0.32, 0.34, 0.36, 0.38, 0.40, 0.42,
			0.44, 0.46, 0.48, 0.5,  0.53, 0.56, 0.59, 0.62, 0.65, 0.68, 
			0.71, 0.74, 0.77, 0.80, 0.83, 0.86, 0.89, 0.92, 0.95, 0.98,
			1.0,  1.06, 1.12, 1.18, 1.24, 1.30, 1.36, 1.42, 1.48, 1.54,
			1.60, 1.66, 1.72, 1.78, 1.84, 1.90, 1.96, 2.0,  2.12, 2.25, 
			2.37, 2.50, 2.62, 2.75, 2.87, 3.0,  3.2,  3.4,  3.6,  3.8,
			4.0,  4.3,  4.7,  4.9,  5.0,  5.5,  6.0,  6.5,  6.8,  7.0,
			7.3,  7.5,  7.8,  8.0,  8.4,  8.7,  9.0,  9.4,  9.6,  9.8, 
			10.0
		];
		private static var multArray:Array = new Array(20);
		private static var methodArray:Array = new Array(20);
		
		private static var lumR:Number = 0.212671;
		private static var lumG:Number = 0.715160;
		private static var lumB:Number = 0.072169;
		
		private static var filterColorMatrix:ColorMatrix = new ColorMatrix();
		
		public function ColorMatrix(brightnessValue:Number = 0, contrastValue:Number = 0, saturationValue:Number = 0, tintColor:int = 0x000000, tintAmount:Number = 0)
		{
			init();
			setBrightnessContrastSaturationTint(brightnessValue,contrastValue,saturationValue,tintColor,tintAmount);
		}
		
		private function init():void
		{
			matrixArray = identityArray.concat();
		}
		
		public function identity():void
		{
			matrixArray = identityArray.concat();
		}
		
		public function setBrightnessContrastSaturationTint(brightnessValue:Number,contrastValue:Number,saturationValue:Number,tintColor:int, tintAmount:Number):void
		{
			contrast(contrastValue);
			brightness(brightnessValue);
			saturation(saturationValue);
			tint(tintColor,tintAmount);
		}
		
		public function tint ( rgb:int, amount:Number):void
		{
			if(amount == 0){
				return;
			}
			amount = clamp(0,100,amount)/100;
			var r:Number = ( ( rgb >> 16 ) & 0xff ) / 255;
			var g:Number = ( ( rgb >> 8  ) & 0xff ) / 255;
			var b:Number = (   rgb         & 0xff ) / 255;
			
			
			var inv_amount:Number = 1 - amount;
			
			methodArray = identityArray.concat();
			methodArray[0] = inv_amount + amount*r*lumR;
			methodArray[1] = amount*r*lumG;
			methodArray[2] = amount*r*lumB;
			methodArray[3] = 0;
			methodArray[4] = 0;
			methodArray[5] = amount*g*lumR;
			methodArray[6] = inv_amount + amount*g*lumG;
			methodArray[7] = amount*g*lumB;
			methodArray[8] = 0;
			methodArray[9] = 0;
			methodArray[10] = amount*b*lumR,amount*b*lumG;
			methodArray[11] = inv_amount + amount*b*lumB;
			methodArray[12] = 0;
			methodArray[13] = 0;
			
			mult(methodArray);
		}
		
		private function saturation(saturationValue:Number):void
		{
			if(saturationValue == 0){
				return;
			}
			saturationValue = clamp(-100,100,saturationValue);
			var x:Number = 1+((saturationValue > 0) ? 3*saturationValue/100 : saturationValue/100);
			
			methodArray = identityArray.concat();
			
			methodArray[0] = lumR*(1-x)+x;
			methodArray[1] = lumG*(1-x);
			methodArray[2] = lumB*(1-x);
			methodArray[3] = 0;
			methodArray[4] = 0;
			
			methodArray[5] = lumR*(1-x);
			methodArray[6] = lumG*(1-x)+x;
			methodArray[7] = lumB*(1-x);
			methodArray[8] = 0;
			methodArray[9] = 0;
			
			methodArray[10] = lumR*(1-x);
			methodArray[11] = lumG*(1-x);
			methodArray[12] = lumB*(1-x)+x;
			methodArray[13] = 0;
			methodArray[14] = 0;
			mult(methodArray);
		}
		
		private function contrast( contrastValue:Number ):void
		{
			if(contrastValue == 0){
				return;
			}
			contrastValue = clamp(-100,100,contrastValue);
			var x:Number;
			if (contrastValue<0) {
				x = 127+contrastValue/100*127
			} else {
				x = contrastValue%1;
				if (x == 0) {
					x = DELTA_INDEX[contrastValue];
				} else {
					x = DELTA_INDEX[(contrastValue<<0)]*(1-x)+DELTA_INDEX[(contrastValue<<0)+1]*x; // use linear interpolation for more granularity.
				}
				x = x*127+127;
			}
			var xDiv:Number = x/127;
			var xMult:Number = .5*(127-x);
			methodArray = identityArray.concat();
			methodArray[0] = xDiv;
			methodArray[4] = xMult;
			methodArray[6] = xDiv;
			methodArray[9] = xMult;
			methodArray[12] = xDiv;
			methodArray[14] = xMult;
			mult(methodArray);
		}
		
		
		private function brightness(brightNessValue:Number):void {
			if(brightNessValue == 0){
				return;
			}
			brightNessValue = clamp(-100,100,brightNessValue);
			methodArray = identityArray.concat();
			methodArray[4] = brightNessValue;
			methodArray[9] = brightNessValue;
			methodArray[14] = brightNessValue;
			mult(methodArray);
		}
		
		private function mult(other:Array):void
		{
			var i:Number = 0;
			for (var y:Number = 0; y < 4; y++ ){
				for(var x:Number = 0; x < 5; x++){
					multArray[i+x] = other[i] * matrixArray[x] + 
						other[i+1] * matrixArray[x +  5] + 
						other[i+2] * matrixArray[x + 10] + 
						other[i+3] * matrixArray[x + 15] +
						(x == 4 ? other[i+4] : 0);
				}
				i+=5;
			}
			matrixArray = multArray.concat();	
		}
		
		private function clamp(min:Number, max:Number, value:Number):Number
		{
			return value = Math.max(min,Math.min(max,value));
		}
		
		public static function getFilter(brightnessValue:Number, contrastValue:Number, saturationValue:Number, tintColor:int, tintAmount:Number):ColorMatrixFilter
		{
			filterColorMatrix.identity();
			filterColorMatrix.setBrightnessContrastSaturationTint(brightnessValue,contrastValue,saturationValue,tintColor,tintAmount);
			var filter:ColorMatrixFilter = new ColorMatrixFilter(filterColorMatrix.matrixArray.concat());
			return filter;
		}
	}
}