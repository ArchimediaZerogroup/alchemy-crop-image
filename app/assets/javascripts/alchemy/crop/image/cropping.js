$(document).on("page:change turbolinks:load", function () {

    var cropper = null;
    var cropperData = null;

    var enableCropperStructure = function () {
        var imageContainer = $(".zoomed-picture-background")[0];
        var picture = $(imageContainer).find("img")[0];

        if (picture) {

            //awful trick: disable click on background to prevent closing popup
            $(".zoomed-picture-background").css("pointer-events", "none");

            var middleBox = $(imageContainer).find(".middle-box-for-cropping")[0]

            if (!middleBox) {
                var box = "<div class='middle-box-for-cropping'><div class=\"cropperjs-container\"></div></div>"
                $(imageContainer).append(box)
                middleBox = $(box)
                var cropperContainer = $(imageContainer).find(".cropperjs-container")

                $(cropperContainer).append(picture)


            }

            //awful trick: enable click on cropping element and prevent propagation of click on it
            middleBox = $(imageContainer).find(".middle-box-for-cropping")[0]
            $(middleBox).css("pointer-events", "auto")
            $(middleBox).click(function (e) {
                e.stopPropagation();
                e.preventDefault();
            })


        }


    }

    var onCrop = function(e){
        $("#field_width_crop").val(e.detail.width)
        $("#field_height_crop").val(e.detail.height)
    }

    var enableCropperWithOptions = function (options) {
        var imageContainer = $(".zoomed-picture-background")[0];
        var picture = $(imageContainer).find("img")[0];

        if (picture) {
            // var cropperData = $(picture).data("cropperjs-data")
            //
            // if(cropperData) {
            //     options = $.extend(options,{
            //         autoCrop: true,
            //         data: cropperData
            //     });
            // }


            if (cropper) {
                destroyCropper();
                // var currentOptions = cropper.options
                // var cropeprElement = cropper.element
                // disableCropper()
                // var newOptions = $.extend(currentOptions, options)
                // cropper = new Cropper(cropeprElement, newOptions)
            }

            cropper = new Cropper(picture, options)

            $(picture).unbind("crop").on("crop", onCrop)


        }


    }

    var disableCropper = function () {
        if (cropper) {
            var picture = cropper.element
            $(picture).data("cropperjs-data", cropper.getData())
            cropper.destroy();
        }
    }

    var destroyCropper = function () {
        if (cropper) {
            cropper.destroy();
            cropper = null;
        }
        //awful trick: enable click on background to prevent closing popup
        $(".zoomed-picture-background").css("pointer-events", "auto");
    }


    var showPanelCropping = function () {
        $(".buttons-action-crop").show()
        $(".crop-panel").show()
        $("#enable-crop").hide()
    }

    var hidePanelCropping = function () {
        $(".buttons-action-crop").hide()
        $(".crop-panel").hide()
        $("#enable-crop").show()
    }



    $(document).on("click", "#enable-crop", function () {
        showPanelCropping();
        enableCropperStructure();
        enableCropperWithOptions(
            {
                dragMode: 'none',
                modal: false,
                rotatable: false,
                scalable: false,
                viewMode: 1,
                autoCrop: true
            }
        );

        // abilito il plugin del cropping
    })

    $(document).on("click", "#button-cancel-crop", function () {
        hidePanelCropping();
        destroyCropper();
        //disabilito il plugin del cropping
    })

    $(document).on("click", "#button-save-crop", function () {
        //chiamata ajax per trasferire l'immagine
    })

    $(document).on("click", "#drag-image", function () {

        if (cropper) {

            if ($(this).hasClass("active")) {
                cropper.setDragMode("none")
                $(this).removeClass("active")
            } else {
                cropper.setDragMode("move")
                $(this).addClass("active")
            }
        }

        //     if($(this).hasClass("active")) {
        //     disableCropper()
        //     $(this).removeClass("active")
        // } else {
        //     enableCropperWithOptions({
        //         dragMode: "move"
        //     })
        //     $(this).addClass("active")
        // }


    })

    $(document).on("click", "#preview-image", function () {
        if (cropper) {

            if ($(this).hasClass("active-no-change")) {

                var imageContainer = $(".zoomed-picture-background")[0];
                var middlebox = $(imageContainer).find(".middle-box-for-cropping")[0];
                var containerCropper = $(middlebox).find(".cropperjs-container")
                var previewBox = $(middlebox).find(".preview-crop");
                var buttonsActions = $(".crop-block .block-command .direct-action");

                $(previewBox).remove();
                $(containerCropper).show()

                $(buttonsActions).prop("disabled",false);
                $(buttonsActions).removeAttr("disabled");


                $(this).removeClass("active-no-change")
                $(this).html("<span class= \"fa fa-eye\"></span>")
            } else {

                var imageContainer = $(".zoomed-picture-background")[0];
                var middlebox = $(imageContainer).find(".middle-box-for-cropping")[0];
                var containerCropper = $(middlebox).find(".cropperjs-container");
                var buttonsActions = $(".crop-block .block-command .direct-action");
                $(containerCropper).css("display", "none");

                var previewBox = $("<div class=\"preview-crop\"></div>");

                var thisButton = this;

                cropper.getCroppedCanvas().toBlob(function(blob){

                    var urlCreator = window.URL || window.webkitURL;
                    var imageUrl = urlCreator.createObjectURL(blob);
                    $(previewBox).append("<img src='"+ imageUrl +"'>");
                    $(middlebox).append(previewBox);

                    $(buttonsActions).prop("disabled",true);
                    $(buttonsActions).attr("disabled", true);

                    $(thisButton).addClass("active-no-change")
                    $(thisButton).html("<span class=\"fa fa-edit\"></span>")
                });


            }


        }
    })

    $(document).on("click", "#crop-zoom-in", function () {
        if (cropper) {
            cropper.zoom(0.05)
        }
    })

    $(document).on("click", "#crop-zoom-out", function () {
        if (cropper) {
            cropper.zoom(-0.05)
        }
    })

    $(document).on("click",".cropper-action-preset-ratio", function() {
        if($(this).hasClass("active")){
            $(this).removeClass("active");
        }else {
            $(".cropper-action-preset-ratio").removeClass("active");
            var aspectRatioVal = $(this).data("value")
            console.log(typeof aspectRatioVal)
            if(cropper) {
                cropper.setAspectRatio(aspectRatioVal)
            }
            $(this).addClass("active");
        }
    })





})