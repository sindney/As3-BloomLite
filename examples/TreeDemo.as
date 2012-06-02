package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import bloom.components.*;
	import bloom.core.ThemeBase;
	import bloom.themes.BlueTheme;
	import bloom.themes.Theme;
	
	/**
	 * TreeDemo
	 */
	public class TreeDemo extends Sprite {
		
		public function TreeDemo():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.showDefaultContextMenu = false;
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			ThemeBase.initialize(stage);
			ThemeBase.theme = new BlueTheme();
			
			var label:Label = new Label(this, "Null");
			
			var tree:Tree = new Tree(this);
			tree.move(0, 20);
			tree.size(200, 400);
			
			tree.group.add(function(e:CheckBoxGroup):void {
				label.text = tree.group.index == -1 ? "Null" : tree.group.target.title.text;
			});
			
			var root:TreeBranch = new TreeBranch(tree, null, "Root");
			
			var branch:TreeBranch = new TreeBranch(tree, null, "Branch0");
			root.addBranch(branch);
			var item:TreeItem = new TreeItem(null, "Item0");
			branch.addItem(item);
			branch = new TreeBranch(tree, null, "Branch1");
			root.addBranch(branch);
			item = new TreeItem(null, "Item1");
			branch.addItem(item);
			item = new TreeItem(null, "Item2");
			branch.addItem(item);
			item = new TreeItem(null, "Item3");
			branch.addItem(item);
			branch = new TreeBranch(tree, null, "Branch2");
			root.addBranch(branch);
			item = new TreeItem(null, "Item4");
			branch.addItem(item);
			item = new TreeItem(null, "Item5");
			branch.addItem(item);
			item = new TreeItem(null, "Item6");
			branch.addItem(item);
			
			branch = new TreeBranch(tree, null, "Branch3");
			root.addBranch(branch);
			item = new TreeItem(null, "Item7");
			branch.addItem(item);
			item = new TreeItem(null, "Item8");
			branch.addItem(item);
			item = new TreeItem(null, "Item9");
			branch.addItem(item);
			
			var branch2:TreeBranch = new TreeBranch(tree, null, "Branch4");
			branch.addBranch(branch2);
			item = new TreeItem(null, "Item10");
			branch2.addItem(item);
			item = new TreeItem(null, "Item11");
			branch2.addItem(item);
			item = new TreeItem(null, "Item12");
			branch2.addItem(item);
			
			var branch3:TreeBranch = new TreeBranch(tree, null, "Branch7");
			branch2.addBranch(branch3);
			item = new TreeItem(null, "Item22");
			branch3.addItem(item);
			item = new TreeItem(null, "Item23");
			branch3.addItem(item);
			item = new TreeItem(null, "Item24");
			branch3.addItem(item);
			
			var branch4:TreeBranch = new TreeBranch(tree, null, "Branch8");
			branch3.addBranch(branch4);
			item = new TreeItem(null, "Item25");
			branch4.addItem(item);
			item = new TreeItem(null, "Item26");
			branch4.addItem(item);
			item = new TreeItem(null, "Item27");
			branch4.addItem(item);
			
			var branch5:TreeBranch = new TreeBranch(tree, null, "Branch8");
			branch4.addBranch(branch5);
			item = new TreeItem(null, "Item28");
			branch5.addItem(item);
			item = new TreeItem(null, "Item29");
			branch5.addItem(item);
			item = new TreeItem(null, "Item30");
			branch5.addItem(item);
			
			branch = new TreeBranch(tree, null, "Branch5");
			root.addBranch(branch);
			item = new TreeItem(null, "Item13");
			branch.addItem(item);
			branch = new TreeBranch(tree, null, "Branch6");
			root.addBranch(branch);
			item = new TreeItem(null, "Item14");
			branch.addItem(item);
			item = new TreeItem(null, "Item15");
			branch.addItem(item);
			item = new TreeItem(null, "Item16");
			branch.addItem(item);
			item = new TreeItem(null, "Item17");
			branch.addItem(item);
			item = new TreeItem(null, "Item18");
			root.addItem(item);
			item = new TreeItem(null, "Item19");
			root.addItem(item);
			item = new TreeItem(null, "Item20");
			root.addItem(item);
			item = new TreeItem(null, "Item21");
			root.addItem(item);
			root.update();
			
			tree.branch = root;
		}
		
	}

}