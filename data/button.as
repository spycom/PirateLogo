package data {
	import flash.events.*;
	import flash.display.*;
	import flash.filters.*;
	import flash.net.*;
	import flash.system.*;
	import flash.utils.*;
	

	public class button extends Sprite{
	
		private var myBevel:BevelFilter;
		private var myBevel_down:BevelFilter;
		public var button_shape:Sprite;
		private var myGlow:GlowFilter; 
		private var myGlow2:GlowFilter; 
		private var pressed:int = 0;
		private var source_serv:String;
		private var source_png_loader:Loader;
		private var source_png_big:String; 
		private var source_png_loader_big:Loader; 
		private var moveTimer:Timer;
		private var xx__:int;
		private var yy__:int;
		 
		public function button(xx:int, yy:int, source_server:String, source_png:String, source_png_big_str:String){
			source_png_big = source_png_big_str;
			source_serv = source_server;
			
			var myShadow:DropShadowFilter = new DropShadowFilter();
				myShadow.blurX = 8;
				myShadow.blurY = 8;
				myShadow.quality = 5;
				myShadow.inner = true;
				
			myBevel = new BevelFilter();
			myBevel.quality =  BitmapFilterQuality.LOW;
			myBevel.shadowAlpha = 0.5;
			myBevel.highlightAlpha = 0.5;
			
			myBevel_down = new 	BevelFilter();
			//myBevel_down.quality =  BitmapFilterQuality.LOW;
			myBevel_down.angle = 225;
			myBevel_down.shadowAlpha = 0.5;
			myBevel_down.highlightAlpha = 0.1;
			
			myGlow = new GlowFilter();
			myGlow.color = 0x9999FF;
			 
			myGlow2 = new GlowFilter();
			myGlow2.color = 0xCCCCFF;
			
			button_shape = new Sprite();
			button_shape.graphics.beginFill(0xCCCCFF,0.5);
			//button_shape.graphics.lineStyle(0);
			button_shape.graphics.drawRoundRect(0, 0 , 40, 40, 8);
			button_shape.filters = [myBevel];
			button_shape.x = xx;
			button_shape.y = yy;
			button_shape.addEventListener(MouseEvent.CLICK, mouseDown);
			button_shape.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			button_shape.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
				addChild(button_shape);
				
			source_png_loader = new Loader();
			source_png_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEvent);
			//source_png_loader.addEventListener(Event., completeEvent);
			
			source_png_loader.load(new URLRequest(source_serv + source_png));
				
				
			
			moveTimer = new Timer(15, 0);
			moveTimer.addEventListener(TimerEvent.TIMER, moveTimerEvent);
		}
		
		public function mouseDown(e:MouseEvent):void {
			if (pressed != 1) {
				//var context:LoaderContext = new LoaderContext();
				//context.checkPolicyFile = true;
				source_png_loader_big = new Loader();
				source_png_loader_big.load(new URLRequest(source_serv + source_png_big));
				source_png_loader_big.x = 30;
				source_png_loader_big.y = 170;
				source_png_loader_big.addEventListener(MouseEvent.MOUSE_DOWN, mouseMoveDown);
				source_png_loader_big.addEventListener(MouseEvent.MOUSE_UP, mouseMoveUp);
				addChild(source_png_loader_big);
				
				button_shape.filters = [myGlow2,myBevel_down];
				pressed = 1;
			} else {
				removeChild(source_png_loader_big);
				button_shape.filters = [myGlow,myBevel];
				pressed = 0;	
			}
		}
		public function mouseOut(e:MouseEvent):void {
			if (pressed != 1) {
			button_shape.filters = [myBevel];
			} else {
			button_shape.filters = [myGlow2,myBevel_down];
			}
		}
		public function mouseOver(e:MouseEvent):void {
			if (pressed != 1) {
			button_shape.filters = [myGlow, myBevel];
			} else {
			button_shape.filters = [myGlow, myBevel_down];
			}
		}
		public function mouseMoveDown(e:MouseEvent):void{
			//source_png_loader_big.x = MouseX;
			//source_png_loader_big.x += 10;
			moveTimer.start();
			xx__ = mouseX;
			yy__ = mouseY;
		}
		public function mouseMoveUp(e:MouseEvent):void {
			moveTimer.stop();
		}
		
		public function moveTimerEvent(e:TimerEvent):void {
				//source_png_loader_big.x += 10;
				source_png_loader_big.x += (mouseX - xx__);
				source_png_loader_big.y += (mouseY - yy__);
				xx__ = mouseX;
				yy__ = mouseY;
				
			}
		private function completeEvent(e:Event):void {
			source_png_loader.x = (40 - source_png_loader.width ) /2;
			source_png_loader.y = (40 - source_png_loader.height ) /2;
			button_shape.addChild(source_png_loader);
		}
	}
}