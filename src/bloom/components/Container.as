package bloom.components 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import bloom.core.Component;
	import bloom.core.ThemeBase;
	import bloom.styles.ContainerStyle;
	
	/**
	 * Container
	 */
	public class Container extends Component {
		
		protected var background:BitmapData;
		
		protected var _content:Sprite;
		
		public function Container(p:DisplayObjectContainer = null) {
			super(p);
			_style = ThemeBase.theme.container;
			_content = new Sprite();
			addChild(_content);
			size(100, 100);
		}
		
		override public function dispose():void {
			super.dispose();
			if (background) background.dispose();
			background = null;
			var i:int, j:int = _content.numChildren;
			for (i = 0; i < j; i++) 
				_content.removeChildAt(0);
			_content = null;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.container;
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			
			var style:ContainerStyle = _style as ContainerStyle;
			if (background) background.dispose();
			
			graphics.clear();
			style.background.setSize(_width, _height);
			background = style.background.bitmapData.clone();
			graphics.beginBitmapFill(background);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public override function toString():String {
			return "[bloom.components.Container]";
		}
	}

}