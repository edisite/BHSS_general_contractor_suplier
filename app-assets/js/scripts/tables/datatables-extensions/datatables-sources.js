/*=========================================================================================
    File Name: datatables-sources.js
    Description: Sources Datatable
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Template
    Version: 2.1
    Author: Pixinvent
    Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
var $base_url = $("body").data("base_url");

$(document).ready(function() {
/**************************************
*       Server-side processing        *
**************************************/
    searchMitra_masterData_barang();
    searchMitra_masterData_gudang();
    searchMitra_masterData_supplier();
    searchMitra_gudang_surat_permintaan_pembelian_barang();
    searchMitra_pembelian_surat_permintaan_pembelian_barang();
    searchMitra_pembelian_po();
    searchMitra_gudang_penerimaan_barang();
    searchMitra_project_list();
    searchMitra_project_rab();
    searchMitra_stok_gudang();
    searchMitra_gudang_out();
    //searchMitra_DataJurnal();

} );
// ------------------- MITRA ------------------
function searchMitra_masterData_barang() { 
    $('#barang-server-side').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/barang/loadData"
    } );    
}
function searchMitra_masterData_gudang() { 
    $('#gudang-server-side').DataTable( {
        "processing": true,
        "serverSide": true,        
        "ajax":  $base_url + "mitra/gudang/loadData"
    } );    
}
function searchMitra_masterData_supplier() { 
    $('#supplier-server-side').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/supplier/loadData"
    } );    
}
function searchMitra_gudang_surat_permintaan_pembelian_barang() { 
    $('#gudang-permintaan-pembelian-barang').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/PermintaanPembelian/loaddata/1"
    } );    
}
function searchMitra_pembelian_surat_permintaan_pembelian_barang() { 
    $('#pembelian-permintaan-pembelian-barang').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/PermintaanPembelian/loaddata/2"
    } );    
}
function searchMitra_pembelian_po() { 
    $('#pembelian_purchase_order').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/PurchaseOrder/loaddata"
    } );    
}
function searchMitra_gudang_penerimaan_barang() { 
    $('#gudang_penerimaan_barang').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/PenerimaanBarang/loaddata/1"
    } );    
}
function searchMitra_project_list() { 
    $('#mitra-project-list').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/project/loaddata"
    } );    
}
function searchMitra_project_rab() { 
    $('#mitra-project-rab').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/project/loaddata_rab"
    } );    
}
function searchMitra_stok_gudang() { 
    $('#inventory_stok_gudang').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/inventory/loaddata"
    } );    
}
function searchMitra_gudang_out() { 
    $('#gudang_out_barang').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":  $base_url + "mitra/inventory/loaddata_gudang_out"
    } );    
}
// function searchMitra_DataJurnal() { 
//     $('#mitraDataJurnal').DataTable( {
//         "processing": true,
//         "serverSide": true,
//         "ajax":  $base_url + "mitra/accounting/JurnalTransaksi_loaddata"
//     } );    
// }

// -------------------END MITRA -----------------