import * as React from 'react';
import { useTheme } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import SkipPreviousIcon from '@mui/icons-material/SkipPrevious';
import PlayArrowIcon from '@mui/icons-material/PlayArrow';
import SkipNextIcon from '@mui/icons-material/SkipNext';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import { useState } from 'react';

function TwoApp() {
    const theme = useTheme();
    const [count,setCount]=useState(0);

  return (
    <div>
      <Card sx={{ display: 'flex' }}>
      <Box sx={{ display: 'flex', flexDirection: 'column' }}>
        <CardContent sx={{ flex: '1 0 auto' }}>
          <Typography component="div" variant="h5">
            Live From Space
          </Typography>
          <Typography
            variant="subtitle1"
            component="div"
            sx={{ color: 'text.secondary' }}
          >
            Mac Miller
          </Typography>
        </CardContent>
        <Box sx={{ display: 'flex', alignItems: 'center', pl: 1, pb: 1 }}>
          <IconButton aria-label="previous">
            {theme.direction === 'rtl' ? <SkipNextIcon /> : <SkipPreviousIcon />}
          </IconButton>
          <IconButton aria-label="play/pause">
            <PlayArrowIcon sx={{ height: 38, width: 38 }} />
          </IconButton>
          <IconButton aria-label="next">
            {theme.direction === 'rtl' ? <SkipPreviousIcon /> : <SkipNextIcon />}
          </IconButton>
        </Box>
      </Box>
      <CardMedia
        component="img"
        sx={{ width: 151 }}
        image="/SemiImg/eventimg4.jpg"
        alt="Live from space album cover"
      />
    </Card>
    <br />

    <Stack direction="row" spacing={2}>
      <Button variant="outlined" color="secondary"
      onClick={()=>{
        setCount(0)
      }}>초기화</Button>
      <Button variant="outlined" color="success"
      onClick={()=>{
        setCount(Number(count+1))
      }}>
        증가
      </Button>
      <Button variant="outlined" color="error"
      onClick={()=>{
        if(count>0){
            setCount(Number(count-1))
        }
      }}>
        감소
      </Button>
    </Stack>
    <br />
    <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
        버튼 누르면 증가 감소
    </Alert>
    <h1>{count}</h1>
    </div>
  )
}

export default TwoApp
