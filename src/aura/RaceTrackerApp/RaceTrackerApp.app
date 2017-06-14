<aura:application implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,force:hasSObjectName"
                  access="global"
                  extends="force:slds">
    
    <article class="slds-tile">
    <div class="slds-page-header">
      <h1 class="slds-page-header__title" title="Inventory">Inventory
      </h1>
    </div>
        <div class="slds-tile__body">
       		<c:LocationPicklist />
          <c:ListRaces />
        </div>
    </article>
</aura:application>