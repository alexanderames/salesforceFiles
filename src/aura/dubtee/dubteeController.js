({
    doInit : function(cmp) {
		let options = [
            {
                label: 'red',
                selected: false
            },
            {
                label:'blue',
                selected: false
            },
            {
                label:'green',
                selected:false
            },
            {
                label:'yellow',
                selected:false
            },
            {
                label: 'orange',
                selected:false
            },
            {
                label:'purple',
                selected:false
            },
            {
                label: 'pink',
                selected:false
            }
        ];
        cmp.set('v.options', options);
    },
    toggleDropdown: function(cmp, event, helper) {
        helper.toggleDropdown(cmp);
    },
    handleClick : function(component, event, helper)
    {
        console.log(event.getSource());
        //let option = event.getSource();
        //console.log(option);
        var menu = component.find("dropdown");
        $A.util.toggleClass(menu, "slds-is-open"); 
     
    }
})