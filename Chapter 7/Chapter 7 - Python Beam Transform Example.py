p = beam.Pipeline()

# apply a series of transforms for the pipeline
(p
    | 'LoadFile' >> beam.io.ReadFromText(input)
    | 'DoSomething' >> beam.FlatMap(lambda line: doSomething(line)) 
    | 'WriteFile' >> beam.io.WriteToText(output)
)

p.run().wait_until_finish()