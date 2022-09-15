# Collecting HCS traces

Use Windows Performance Recorder and the included ContainerPlatform.wprp file to collect HCS traces.
To do so run:

```cmd
wpr.exe -start c:\hpc\debug\containerplatform.wprp
<reproduce issue>
wpr.exe -stop trace.etl
```

Then use https://docs.microsoft.com/windows-hardware/test/wpt/windows-performance-analyzer to view the traces saved in trace.etl