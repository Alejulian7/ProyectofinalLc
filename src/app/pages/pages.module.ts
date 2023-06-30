import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { InicioComponent } from './inicio/inicio.component';
import { HistoriaComponent } from './historia/historia.component';
import { RegionesComponent } from './regiones/regiones.component';
import { ContactanosComponent } from './contactanos/contactanos.component';



@NgModule({
  declarations: [
    InicioComponent,
    HistoriaComponent,
    RegionesComponent,
    ContactanosComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PagesModule { }
