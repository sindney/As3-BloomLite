package bloom.components 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	import bloom.core.Margin;
	import bloom.core.IObjectBase;
	import bloom.core.ThemeBase;
	import bloom.styles.AccordionStyle;
	import bloom.styles.IStyle;
	
	/**
	 * Accordion
	 */
	public class Accordion extends Container {
		
		private var _multiSelect:Boolean;
		
		private var _last:AccordionContent;
		private var _target:AccordionContent;
		private var _objects:Vector.<AccordionContent>;
		
		public function Accordion(p:DisplayObjectContainer = null) {
			super(p);
			
			_multiSelect = false;
			_objects = new Vector.<AccordionContent>();
			
			style = ThemeBase.theme.accordion;
		}
		
		public function addContent(value:AccordionContent):void {
			_objects.push(value);
			value.style = _style;
			value.mouseClicked.add(onContentClick);
			_content.addChild(value);
		}
		
		public function removeContent(value:AccordionContent):void {
			removeContentAt(_objects.indexOf(value));
		}
		
		public function removeContentAt(index:int):AccordionContent {
			var object:AccordionContent = _objects[index];
			if (object) {
				_objects.splice(index, 1)[0];
				object.mouseClicked.remove(onContentClick);
				_content.removeChild(object);
			}
			return object;
		}
		
		public function getContentAt(index:int):AccordionContent {
			return _objects[index];
		}
		
		/**
		 * Call update() after addContent/removeContent ... 
		 */
		public function update():void {
			var last:Number = 0;
			
			var object:AccordionContent;
			for each(object in _objects) {
				if (!_multiSelect) if (object != _target) object.selected = false;
				object.y = last;
				last = object.y + object.height;
			}
			_onResized.dispatch();
		}
		
		override public function dispose():void {
			super.dispose();
			for each(var object:AccordionContent in _objects) object.dispose();
			_objects = null;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.accordion;
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			update();
		}
		
		private function onContentClick(e:Event):void {
			_target = e.target.parent as AccordionContent;
			update();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function set multiSelect(value:Boolean):void {
			_multiSelect = value;
		}
		
		public function get multiSelect():Boolean {
			return _multiSelect;
		}
		
		override public function set style(value:IStyle):void {
			if (_style != value) {
				_style = value;
				if (_style) {
					for each(var object:AccordionContent in _objects) object.style = _style;
				}
			}
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.Accordion]";
		}
		
	}

}