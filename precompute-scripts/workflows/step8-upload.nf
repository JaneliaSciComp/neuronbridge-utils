include { UPLOAD        } from '../modules/local/upload/main.nf'

include { get_list_arg; } from '../nfutils/utils'

workflow {

    def upload_inputs = Channel.of(
        [
            params.anatomical_area,
            params.base_data_dir,
            params.data_version
        ]
    )

    def upload_results = UPLOAD(
        upload_inputs,
        params.aws_runner,
        get_list_arg(params.upload_type),
        params.upload_bucket,
        params.dry_run,
    )

    upload_results | view
}
