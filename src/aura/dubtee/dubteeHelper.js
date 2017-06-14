({
	toggleDropdown: function(cmp) {
		let toggle = cmp.get('v.showDropdown');
        toggle = !toggle;
        cmp.set('v.showDropdown', toggle);
	}
})