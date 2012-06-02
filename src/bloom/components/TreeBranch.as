package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import bloom.styles.TreeStyle;
	
	/**
	 * TreeBranch
	 */
	public class TreeBranch extends CheckBox {
		
		private var _numItems:int = 0;
		private var _numBranches:int = 0;
		private var _items:Vector.<TreeItem>;
		private var _branches:Vector.<TreeBranch>;
		
		private var content:Sprite;
		
		private var _tree:Tree;
		
		public function TreeBranch(tree:Tree, p:DisplayObjectContainer = null, title:String = "", value:Boolean = false) {
			super(p, title, value);
			_items = new Vector.<TreeItem>();
			_branches = new Vector.<TreeBranch>();
			content = new Sprite();
			addChild(content);
			this.tree = tree;
		}
		
		public function update():void {
			var i:int;
			var posY:Number = _title.height;
			var item:TreeItem;
			var branch:TreeBranch;
			if (_value) {
				for (i = 0; i < _numBranches; i++) {
					branch = _branches[i];
					branch.x = branch.height;
					branch.y = posY;
					branch.update();
					posY += branch.value ? branch.content.height + branch.height : branch.height;
				}
				for (i = 0; i < _numItems; i++) {
					item = _items[i];
					item.x = item.height;
					item.y = posY;
					posY += item.height;
				}
				if (!content.parent) addChild(content);
			} else if (content.parent) {
				removeChild(content);
			}
			if (tree && tree.branch) {
				if (tree.branch.content.parent) {
					tree.setContentSize(tree.branch.content.width + tree.branch.height, tree.branch.content.height + tree.branch.height);
				} else {
					tree.setContentSize(tree.branch.width, tree.branch.height);
				}
			}
		}
		
		public function addItem(object:TreeItem):void {
			_items.push(object);
			_numItems++;
			object.tree = _tree;
			content.addChild(object);
			if (_tree) _tree.group.addChild(object);
		}
		
		public function removeItem(object:TreeItem):void {
			var index:int = _items.indexOf(object);
			if (index != -1) {
				_numItems--;
				_items.splice(index, 1);
			}
			if (_tree) _tree.group.removeChild(object);
			content.removeChild(object);
			object.tree = null;
		}
		
		public function removeItemAt(index:int):TreeItem {
			var object:TreeItem = _items[index];
			if (object) {
				_numItems--;
				_items.splice(index, 1);
				if (_tree) _tree.group.removeChild(object);
				content.removeChild(object);
				object.tree = null;
			}
			return object;
		}
		
		public function getItemAt(index:int):TreeItem {
			return _items[index];
		}
		
		public function addBranch(object:TreeBranch):void {
			_branches.push(object);
			_numBranches++;
			object.tree = _tree;
			content.addChild(object);
		}
		
		public function removeBranch(object:TreeBranch):void {
			var index:int = _branches.indexOf(object);
			if (index != -1) {
				_numBranches--;
				_branches.splice(index, 1);
			}
			object.tree = null;
			content.removeChild(object);
		}
		
		public function removeBranchAt(index:int):TreeBranch {
			var object:TreeBranch = _branches[index];
			if (object) {
				_numBranches--;
				_branches.splice(index, 1);
				object.tree = null;
				content.removeChild(object);
			}
			return object;
		}
		
		public function getBranchAt(index:int):TreeBranch {
			return _branches[index];
		}
		
		override public function dispose():void {
			super.dispose();
			var item:TreeItem;
			for each(item in _items) {
				_tree.group.removeChild(item);
				item.dispose();
			}
			_items = null;
			var branch:TreeBranch;
			for each(branch in _branches) {
				branch.dispose();
			}
			_branches = null;
			_tree = null;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock && _tree) style = (_tree.style as TreeStyle).branch;
		}
		
		override protected function onMouseClick(e:MouseEvent):void {
			if (mouseX < _title.width + _title.x && mouseY < _title.height) {
				value = !_value;
				_tree.branch.update();
			}
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get tree():Tree {
			return _tree;
		}
		
		public function set tree(value:Tree):void {
			if (_tree != value) {
				_tree = value;
				if (_tree) {
					style = (tree.style as TreeStyle).branch;
					var item:TreeItem;
					for each(item in _items) {
						item.tree = _tree;
					}
					var branch:TreeBranch;
					for each(branch in _branches) {
						branch.tree = _tree;
					}
				}
			}
		}
		
		override public function set value(value:Boolean):void {
			if (_value != value) {
				_value = value;
				_valueChanged.dispatch(this);
				_changed = true;
				invalidate();
				update();
			}
		}
		
		public function get numBranches():int {
			return _numBranches;
		}
		
		public function get numItems():int {
			return _numItems;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.TreeBranch]";
		}
	}

}