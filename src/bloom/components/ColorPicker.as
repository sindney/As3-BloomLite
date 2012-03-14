package bloom.components 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.natives.NativeSignal;
	
	import bloom.core.ThemeBase;
	import bloom.styles.TextInputStyle;
	
	/**
	 * ColorPicker
	 */
	public class ColorPicker extends TextInput {
		
		private var regexp:RegExp;
		private var mouseClicked:NativeSignal;
		private var mouseMove:NativeSignal;
		
		private var signal:Sprite;
		private var colorMap:Sprite;
		private var _plate:Bitmap;
		
		private var _color:uint = 1;
		
		public function ColorPicker(p:DisplayObjectContainer = null, color:uint = 0x000000) {
			super(p);
			
			signal = new Sprite();
			signal.buttonMode = true;
			addChild(signal);
			
			colorMap = new Sprite();
			colorMap.buttonMode = true;
			
			_plate = new Bitmap();
			colorMap.addChild(_plate);
			
			plate = ThemeBase.theme.plate;
			
			mouseClicked = new NativeSignal(signal, MouseEvent.CLICK, MouseEvent);
			mouseClicked.add(onMouseClicked);
			
			mouseMove = new NativeSignal(colorMap, MouseEvent.MOUSE_MOVE, MouseEvent);
			
			regexp = /^0x(?:[0-9A-F]{6})$/;
			
			_textBase.restrict = "x0-9A-F";
			_textBase.maxChars = 8;
			_textBase.onTextChanged.add(onTextChanged);
			
			this.color = color;
		}
		
		private function onMouseClicked(e:MouseEvent):void {
			if (!colorMap.parent && parent) {
				mouseMove.add(onMouseMove);
				ThemeBase.onStageMouseUp.addOnce(onMouseUp);
				parent.addChild(colorMap);
				
				colorMap.x = x + _width + _margin.right;
				colorMap.y = y;
			}
		}
		
		private function onMouseMove(e:MouseEvent):void {
			color = _plate.bitmapData.getPixel(colorMap.mouseX, colorMap.mouseY);
		}
		
		private function onMouseUp(e:MouseEvent):void {
			mouseMove.remove(onMouseMove);
			parent.removeChild(colorMap);
		}
		
		private function onTextChanged(e:Event):void {
			if (regexp.test(_textBase.text)) {
				color = uint(_textBase.text);
			}
		}
		
		override protected function onThemeChanged():void {
			style = ThemeBase.theme.textInput;
			plate = ThemeBase.theme.plate;
		}
		
		override public function dispose():void {
			super.dispose();
			ThemeBase.onStageMouseUp.remove(onMouseUp);
			mouseClicked.removeAll();
			mouseClicked = null;
			mouseMove.removeAll();
			mouseMove = null;
			colorMap.removeChild(_plate);
			_plate.bitmapData.dispose();
			_plate = null;
			if (colorMap.parent) parent.removeChild(colorMap);
			colorMap = null;
			removeChild(signal);
			signal.graphics.clear();
			signal = null;
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			
			var style:TextInputStyle = _style as TextInputStyle;
			if (background) background.dispose();
			
			graphics.clear();
			if (active) {
				_textBase.style = style.text_active;
				style.active.setSize(_width, _height);
				background = style.active.bitmapData.clone();
			} else {
				_textBase.style = style.text_normal;
				style.normal.setSize(_width, _height);
				background = style.normal.bitmapData.clone();
			}
			graphics.beginBitmapFill(background);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
			
			_textBase.size(_width - _height, _height);
			signal.x = _textBase.width;
			
			signal.graphics.clear();
			signal.graphics.beginFill(_color, 1);
			signal.graphics.drawRect(0, 0, _height, _height);
			signal.graphics.endFill();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get color():uint {
			return _color;
		}
		
		public function set color(value:uint):void {
			if (_color != value) {
				_color = value;
				
				var i:int = 0;
				var tmp:String = _color.toString(16);
				var plus:String = "";
				
				if (tmp == "0") {
					tmp = "000000";
				} else if (tmp.length < 6) {
					while (i < 6 - tmp.length) {
						i++;
						plus += "0";
					}
				}
				
				_textBase.text = "0x" + plus + tmp.toUpperCase();
				
				signal.graphics.clear();
				signal.graphics.beginFill(_color, 1);
				signal.graphics.drawRect(0, 0, _height, _height);
				signal.graphics.endFill();
			}
		}
		
		public function set plate(value:BitmapData):void {
			if (_plate.bitmapData != value) {
				if (_plate.bitmapData)_plate.bitmapData.dispose();
				_plate.bitmapData = value.clone();
			}
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public override function toString():String {
			return "[bloom.components.ColorPicker]";
		}
	}

}