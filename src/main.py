from phiskills.grpc import Api
from phisuite import data

MAX_WORKERS = 10
GRACE = 60


class ProcessServer(data.ProcessAPIServicer):

    def Execute(self, request_iterator, context):
        for req in request_iterator:
            print(f"Execute: {req}")
            yield data.ProcessResponse(id=f'{req.name}:{req.version}')


def main():
    api = Api('Process Executor', max_workers=MAX_WORKERS)
    data.add_ProcessAPIServicer_to_server(ProcessServer(), api.server)
    api.start(grace=GRACE)


if __name__ == '__main__':
    main()
