$(document).ready(function() {
    $("#calc_RFS").click(function() {

        var Vs = parseFloat($("#Vs").val());
        var Vs_tolerance = parseFloat($("#Vs_tolerance").val());
        var mVnoise = parseFloat($("#mVnoise").val());
        var V_noise = mVnoise / 1000;
        var R_T1 = parseFloat($("#R_T1").val());

        V_S = Vs / 100 * (100 - Vs_tolerance);
        var V_AB = 0.2 + V_noise;

        var R_FS = ((V_S / V_AB)+1) * (1/( (1/375)+(4/R_T1) ));
        $("#step1_output").html("R<sub>FS</sub> must be less than "+R_FS.toFixed(0)+" ohm.");
        $("#R_FS").val(R_FS.toFixed(0));
    });

    $("#calc_RT2").click(function() {

        var R_T1 = parseFloat($("#R_T1").val());
        var R_FS = parseFloat($("#R_FS").val());

        var R_T2 = 1 / ( (1/R_T1) - (1/(2*R_FS)) );
        $("#step2_output").html("Choose R_<sub>T2</sub> as close to "+R_T2.toFixed(0)+" as possible.");
        $("#R_T2").val(R_T2.toFixed(0));
    });

    $("#calc_stats").click(function() {
        var R_T1 = parseFloat($("#R_T1").val());
        var R_FS = parseFloat($("#R_FS").val());
        var R_T2 = parseFloat($("#R_T2").val());

        var R_INEQ = 1 / ( (1/375) - (1/R_FS) );
        var n_max = 12000 / R_INEQ;
        var diff_imp = 1 / ( (1/R_T1) + (1/R_T2) + (1/(2*R_FS)) );

        var Vs = parseFloat($("#Vs").val());
        var Vs_tolerance = parseFloat($("#Vs_tolerance").val());
        V_S = Vs / 100 * (100 - Vs_tolerance);
        var R_T1_T2 = 1 / ( (1/R_T1)+(1/R_T2) ); // R_T1 || R_T2
        var V_AB = (R_T1_T2 / (R_T1_T2 + 2*R_FS)) * V_S;
        var noise_margin_mV = (V_AB - 0.2) * 1000;

        $("#step3_output").html("Differential impedance: "+(diff_imp).toFixed(1)+" ohm<br>"
                                +"V<sub>AB</sub>: "+V_AB.toFixed(2)+" V<br>"
                                +"Noise margin: "+noise_margin_mV.toFixed(0)+" mV<br>"
                                +"Max. unit loads: "+n_max.toFixed(2)
                                +"<br>Max. 1/2 unit load devices: "+(n_max*2).toFixed(2)
                                +"<br>Max. 1/4 unit load devices: "+(n_max*4).toFixed(2));


    });


});
