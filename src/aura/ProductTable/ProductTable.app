<aura:application extends="force:slds" implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,force:hasSObjectName" access="global" >
	<div class="slds">
    <div class="slds-page-header noborderbottom" role="banner"> 
      <div class="slds-grid">
        <div class="slds-col slds-has-flexi-truncate">
          <p class="slds-text-heading--label">Inventory Management</p>
          <div class="slds-grid">
            <div class="slds-grid slds-type-focus slds-no-space">
              <h1 class="slds-page-header__title slds-truncate">Brawl-Mart Product Stocklist</h1>
            </div>
          </div>
        </div>
      </div>
    </div>   
  </div>
	<c:InventoryManagement />
</aura:application>